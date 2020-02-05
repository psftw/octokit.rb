module Octokit
  class Client

    # Methods for the Actions API
    #
    # @see https://developer.github.com/v3/actions/
    module Actions

      # Methods for Action Artifacts
      #
      # @see https://developer.github.com/v3/actions/artifacts/

      # List workflow run artifacts
      #
      # @param repo [Integer, String, Hash] A GitHub repository
      # @param id [Integer] The ID of the workflow run
      # @param options [Sawyer::Resource] A customizable set of options.
      # @option options [Integer] :page (1) Page number.
      # @return [Sawyer::Resource] The issue you requested, if it exists
      # @see https://developer.github.com/v3/actions/artifacts/#list-workflow-run-artifacts
      def action_run_artifacts(repo, id, options = {})
        get "#{Repository.path repo}/actions/runs/#{id}/artifacts", options
      end


      # Get an artifact
      #
      # @param repo [Integer, String, Hash] A GitHub repository
      # @param id [Integer] The ID of the artifact
      # @return [Sawyer::Resource] The issue you requested, if it exists
      # @see https://developer.github.com/v3/actions/artifacts/#get-an-artifact
      def artifact(repo, id)
        get "#{Repository.path repo}/actions/artifacts/#{id}"
      end

      # Download an artifact
      # 
      # @param repo [Integer, String, Hash] A GitHub repository
      # @param id [Integer] The ID of the artifact
      # @return [Sawyer::Resource] The issue you requested, if it exists
      # @see https://developer.github.com/v3/actions/artifacts/#download-an-artifact
      def download_artifact(repo, id)
        get "#{Repository.path repo}/actions/artifacts/#{id}/zip"
      end

      # Delete an artifact
      #
      # @param repo [Integer, String, Hash] A GitHub repository
      # @param id [Integer] The ID of the artifact
      # @return [Boolean] Success
      # @see https://developer.github.com/v3/actions/artifacts/#delete-an-artifact
      def delete_artifact(repo, id)
        boolean_from_response :delete, "#{Repository.path repo}/actions/artifacts/#{id}"
      end

      # Methods for Action Secrets
      #
      # @see https://developer.github.com/v3/actions/secrets/

      # Get your public key
      #
      # @param repo [Integer, String, Hash] A GitHub repository
      # @return [Sawyer::Resource] The Repository public key
      # @see https://developer.github.com/v3/actions/secrets/#get-your-public-key
      def public_key(repo)
        get "#{Repository.path repo}/actions/secrets/public-key"
      end

      # List secrets for a repository
      #
      # @param repo [Integer, String, Hash] A GitHub repository
      # @return [Sawyer::Resource] The Repository public key
      # @see https://developer.github.com/v3/actions/secrets/#list-secrets-for-a-repository
      def secrets(repo)
        get "#{Repository.path repo}/actions/secrets"
      end

      # Get a secret
      #
      # @param repo [Integer, String, Hash] A GitHub repository
      # @param name [String] Secret name
      # @return [Sawyer::Resource] The Secret metadata
      # @see https://developer.github.com/v3/actions/secrets/#get-a-secret
      def secret(repo, name)
        get "#{Repository.path repo}/actions/secrets/#{name}"
      end

      # Create or update a secret for a repository
      #
      # @param repo [Integer, String, Hash] A GitHub repository
      # @param name [String] Secret name
      # @param id [String] GitHub repository public key
      # @param value [String] Secret value encrypted with public key
      # @see https://developer.github.com/v3/actions/secrets/#create-or-update-a-secret-for-a-repository
      def create_secret(repo, name, id, value)
        put "#{Repository.path repo}/actions/secrets/#{name}", {encrypted_value: value, key_id: id}
      end

      # Delete a secret from a repository
      #
      # @param repo [Integer, String, Hash] A GitHub repository
      # @param name [String] Secret name
      # @return [Boolean] Success
      # @see https://developer.github.com/v3/actions/secrets/#delete-a-secret-from-a-repository
      def delete_secret(repo, name)
        boolean_from_response :delete, "#{Repository.path repo}/actions/secrets/#{name}"
      end

      # Methods for Self-hosted runners
      #
      # NOT IMPLEMENTED
      # @see https://developer.github.com/v3/actions/self_hosted_runners/

      # Methods for Workflows
      #
      # @see https://developer.github.com/v3/actions/workflows/

      # List repository workflows
      # @param repo [Integer, String, Hash] A GitHub repository
      # @param options [Sawyer::Resource] A customizable set of options.
      # @option options [Integer] :page (1) Page number.
      # @return [Sawyer::Resource] The Secret metadata
      # @see https://developer.github.com/v3/actions/workflows/#list-repository-workflows
      def workflows(repo, options = {})
        get "#{Repository.path repo}/actions/workflows", options
      end

      # Get a workflow
      #
      # @param repo [Integer, String, Hash] A GitHub repository
      # @param id [Integer, String] The ID or filename of the workflow
      # @see https://developer.github.com/v3/actions/workflows/#get-a-workflow
      def workflow(repo, id)
        get "#{Repository.path repo}/actions/workflows/#{id}"
      end

      # Methods for Workflow Jobs
      #
      # @see https://developer.github.com/v3/actions/workflow_jobs/

      # List jobs for a workflow run
      #
      # @param repo [Integer, String, Hash] A GitHub repository
      # @param id [Integer, String] The ID of the workflow run
      # @return [Sawyer::Resource] The jobs for a workflow run
      # @see https://developer.github.com/v3/actions/workflow_jobs/#list-jobs-for-a-workflow-run
      def workflow_run_jobs(repo, id, options = {})
        get "#{Repository.path repo}/actions/runs/#{id}/jobs", options
      end

      # Get a workflow job
      #
      # @param repo [Integer, String, Hash] A GitHub repository
      # @param id [Integer, String] The ID of the workflow job
      # @return [Sawyer::Resource] The workflow job
      # @see https://developer.github.com/v3/actions/workflow_jobs/#get-a-workflow-job
      def workflow_job(repo, id)
        get "#{Repository.path repo}/actions/jobs/#{id}"
      end

      # List workflow job logs
      #
      # @param repo [Integer, String, Hash] A GitHub repository
      # @param id [Integer, String] The ID of the workflow job
      # @return [Sawyer::Resource] The workflow job logs
      # @see https://developer.github.com/v3/actions/workflow_jobs/#list-workflow-job-logs
      def workflow_job_logs(repo, id)
        get "#{Repository.path repo}/actions/jobs/#{id}/logs"
      end

      # Methods for Workflow Runs
      #
      # @see https://developer.github.com/v3/actions/workflow_runs/

      # List workflow runs
      #
      # @param repo [Integer, String, Hash] A GitHub repository
      # @param id [Integer, String] The ID of the workflow
      # @param options [Sawyer::Resource] A customizable set of options.
      # @option options [Integer] :page (1) Page number.
      # @option options [String] :actor Filter by user who triggered workflow run
      # @option options [String] :branch Filter by branch
      # @option options [String] :event Filter by triggering event (i.e. push)
      # @option options [String] :status Filter by check run status (i.e. success)
      # @return [Sawyer::Resource] The workflow job logs
      # @see https://developer.github.com/v3/actions/workflow_runs/#list-workflow-runs
      def workflow_runs(repo, id, options = {})
        get "#{Repository.path repo}/actions/workflows/#{id}/runs", options
      end

      # List repository workflow runs
      #
      # @param repo [Integer, String, Hash] A GitHub repository
      # @param options [Sawyer::Resource] A customizable set of options.
      # @option options [Integer] :page (1) Page number.
      # @option options [String] :actor Filter by user who triggered workflow run
      # @option options [String] :branch Filter by branch
      # @option options [String] :event Filter by triggering event (i.e. push)
      # @option options [String] :status Filter by check run status (i.e. success)
      # @return [Sawyer::Resource] The workflow job logs
      # @see https://developer.github.com/v3/actions/workflow_runs/#list-repository-workflow-runs
      def all_workflow_runs(repo, options = {})
        get "#{Repository.path repo}/actions/runs", options
      end

      # Get a workflow run
      #
      # @param repo [Integer, String, Hash] A GitHub repository
      # @param id [Integer, String] The ID of the workflow run
      # @return [Sawyer::Resource] The workflow job logs
      # @see https://developer.github.com/v3/actions/workflow_runs/#get-a-workflow-run
      def workflow_run(repo, id)
        get "#{Repository.path repo}/actions/runs/#{id}"
      end

      # Re-run a workflow
      #
      # @param repo [Integer, String, Hash] A GitHub repository
      # @param id [Integer, String] The ID of the workflow run
      # @return [Boolean] Success
      # @see https://developer.github.com/v3/actions/workflow_runs/#re-run-a-workflow
      def rerun_workflow_run(repo, id)
        boolean_from_response :post, "#{Repository.path repo}/actions/runs/#{id}/rerun"
      end

      # Cancel a workflow run
      #
      # @param repo [Integer, String, Hash] A GitHub repository
      # @param id [Integer, String] The ID of the workflow run
      # @return [Boolean] Success
      # @see https://developer.github.com/v3/actions/workflow_runs/#cancel-a-workflow-run
      def cancel_workflow_run(repo, id)
        boolean_from_response :post, "#{Repository.path repo}/actions/runs/#{id}/cancel"
      end

      # List workflow run logs
      #
      # @param repo [Integer, String, Hash] A GitHub repository
      # @param id [Integer, String] The ID of the workflow run
      # @see https://developer.github.com/v3/actions/workflow_runs/#list-workflow-run-logs
      def workflow_run_logs(repo, id)
        get "#{Repository.path repo}/actions/runs/#{id}/logs"
      end
    end
  end
end
