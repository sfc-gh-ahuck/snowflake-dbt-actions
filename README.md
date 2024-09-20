# Snowflake with dbt and GitHub Actions
This project is a Blueprint for running dbt for Snowflake using GitHub Actions and host the documentaion on GitHub Pages.

## Setting up new project
When forking or copying this project you will need to setup your newly created GitHub Repository:

### 1. Create Required Secrets for the Workflows
You will need to set following Secrets within your project.
( Settings > Secrets > Actions > New repository secret )
```
DBT_SNOWFLAKE_ACCOUNT (eg. acme-marketing-test-account or test.us-east-2.aws)
DBT_SNOWFLAKE_USER
DBT_SNOWFLAKE_PASSWORD
DBT_DATABASE_PROD (Production target Database. Must exist. eg. CITIBIKE)


Optional:
DBT_SCHEMA (using "demo" if not set)
DBT_SNOWFLAKE_WAREHOUSE (using default if not set)
DBT_SNOWFLAKE_WAREHOUSE_PROD (using non-prod or default warehouse.)
```
The Account should be set **without** trailing `.snowflakecomputing.com`.

### 2. Enable GitHub Actions and execute first run
Enable GitHub Actions as described in the "Actions" tab in your project.
After enabling, **run the "Push to Main Branch" workflow** ( Actions > select "Push to Main Branch" > Run Workflow ) with the main branch selected. This run will create the first dbt Documentation deployment to GitHub Pages.

### 3. Enable GitHub Pages
The previous step deployed the dbt documentationto the `gh-pages` branch. To serve it, enable GitHub Pages through the project settings ( Settings > Pages ), select the `gh-pages` at root folder as source. Lastly, depending on your subscription, you might need to **set the Pages visibility to public** - otherwise you'll see a 401 page.
Check the green header on the Pages settings page for the URL to the documentation.


## Using this Project locally
To install all requirements run:
```
pip3 install -r requirements.txt
```

Then try running the following commands:
- dbt compile
- dbt run
- dbt test

Following commands will generate and serve the documentation locally:
- dbt docs generate
- dbt docs serve


## Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
