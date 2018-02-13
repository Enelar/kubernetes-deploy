# frozen_string_literal: true
module KubernetesDeploy
  class Mail < KubernetesResource
    TIMEOUT = 30.seconds

    def sync
      _, _err, st = kubectl.run("get", type, @name)
      @found = st.success?
    end

    def deploy_succeeded?
      exists?
    end

    def exists?
      @found
    end

    def deploy_failed?
      false
    end

  end
end
