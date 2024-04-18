# Example 1

This example shows how to

1. Create a single file
2. Create multiple files iterating a list
3. How to emulate and "if" statement creating a file based on some condition


- Steps

1) Verify that the files are syntactically correct. This means checking that the syntax conforms to the HCL (HashiCorp Configuration Language) standards.
```bash
terraform validate
```
2)  Initialize terraform

    a) Initializes the Backend: Terraform supports various backends for storing state files. The init command configures the backend specified in the Terraform configuration. This could be a local file system, remote key-value stores, or cloud storage services like AWS S3, Google Cloud Storage, or Azure Blob Storage. Initializing the backend involves setting up and verifying connectivity and permissions.

    b) Downloads and Installs Providers: Terraform uses plugins called "providers" to interact with APIs of various service providers (like AWS, Google Cloud, Azure, etc.). The init command scans the Terraform code to find the required providers and installs the necessary plugins. It downloads these from the Terraform Registry or other configured sources.

    c) Module Installation: If your Terraform configurations use modules (reusable pieces of Terraform code), terraform init will download and install these modules. For modules hosted remotely, such as in Git repositories or Terraform Module Registry, this command will handle the downloading and installation.

    d) Initializes Workspace: Terraform supports the concept of workspaces, which allow you to manage different states of your infrastructure corresponding to different environments (like development, staging, production) using the same configuration. terraform init sets up the initial workspace if it has not been created yet.

    ```bash
    terraform init
    ```
3) Plan

    a) Reads Configuration: terraform plan starts by reading your Terraform configuration files to understand the resources that you intend to manage. This includes everything defined in your .tf files within the working directory or specified directories.

    b) Refreshes State: Terraform maintains a state file that tracks the state of your managed resources. terraform plan will refresh this state before comparing it with the desired state described in your configuration. This step involves querying the actual state of resources managed by Terraform from the relevant APIs (like AWS, Google Cloud, Azure, etc.).

    c) Compares Desired and Current State: After refreshing the state, Terraform compares the current state with the desired state defined in your configurations. This comparison identifies any differences between the infrastructure you have deployed and what your configuration specifies.

    d) Outputs a Plan: The primary output of terraform plan is a detailed description of the actions Terraform needs to take to reconcile the current state with the desired state. 

    ```bash
    terraform plan
    ```
4) Apply changes

    a) Execution Plan: Typically, you start with running terraform plan to generate an execution plan. This plan outlines what Terraform intends to do to achieve the desired state specified in your Terraform configuration files. While terraform apply can automatically generate and execute a plan, it is a best practice to separately review the plan from terraform plan before applying it.

    b) Asks for Approval: By default, when you run terraform apply, Terraform will display the plan and ask for your approval before proceeding to make any changes. This approval step is crucial as it gives you one last chance to review the changes before they are applied to your live infrastructure.

    c) Resource Management: Based on the approved plan, Terraform will then provision, modify, or delete resources as needed. This includes calling APIs of service providers (like AWS, Google Cloud, Azure, etc.) to manage the infrastructure components such as servers, databases, networks, etc.

    d) State Management: Terraform tracks the state of your infrastructure in a state file. After terraform apply makes changes, it updates this state file to reflect the current state of all managed resources. This state file is crucial for future operations and must be handled and stored securely.

    e) Outputs: After applying the changes, Terraform outputs any defined outputs. These outputs can include useful information such as public IP addresses, hostnames, or other data related to the resources it manages.
    ```bash
    terraform apply
    ```
    ```bash
    terraform apply --auto-approve #Apply but without having to type 'yes' 
    ```
5) Display Current State
    ```bash
    terraform show
    ```

6) Destroy

    a) Reads Configuration and State: Terraform uses your configuration files along with the state file to determine which resources are currently managed by Terraform. The state file contains a record of all resources that Terraform has provisioned and is managing.

    b) Generates a Destruction Plan: terraform destroy generates a plan that shows which resources will be destroyed. This is similar to the plan generated by terraform plan, but in reverse, as it outlines the removal of resources.

    c) Asks for User Confirmation: Before executing the destruction plan, Terraform will typically ask for explicit approval from the user to proceed with destroying the resources. This confirmation step is crucial to avoid accidental deletions of important resources.

    d) Destroys Resources: Upon confirmation, Terraform proceeds to destroy the resources. It does this in a reverse order of their creation to respect dependencies; for example, a database must be emptied before the server it runs on is deleted.

    e) Updates State File: After the resources have been destroyed, Terraform updates the state file to reflect that the resources no longer exist. This ensures that the state file remains accurate and up-to-date, reflecting the actual state of your infrastructure.
    ```bash
    terraform destroy --auto-approve
    ```