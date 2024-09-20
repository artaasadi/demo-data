--
-- PostgreSQL database dump
--

-- Dumped from database version 14.13 (Debian 14.13-1.pgdg120+1)
-- Dumped by pg_dump version 14.13 (Debian 14.13-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: citext; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;


--
-- Name: EXTENSION citext; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION citext IS 'data type for case-insensitive character strings';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: config_metadata; Type: TABLE; Schema: public; Owner: metadata_service
--

CREATE TABLE public.config_metadata (
    key text NOT NULL,
    type text DEFAULT 'string'::text,
    value text NOT NULL
);


ALTER TABLE public.config_metadata OWNER TO metadata_service;

--
-- Name: query_parameters; Type: TABLE; Schema: public; Owner: metadata_service
--

CREATE TABLE public.query_parameters (
    key text NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.query_parameters OWNER TO metadata_service;

--
-- Data for Name: config_metadata; Type: TABLE DATA; Schema: public; Owner: metadata_service
--

COPY public.config_metadata (key, type, value) FROM stdin;
workspace_id	string	ws-530663329664863214
workspace_name	string	main
workspace_date_time_format	string	1900-01-02
workspace_debug_mode	bool	FALSE
workspace_time_window	string	30d
asset_management_enabled	bool	TRUE
compliance_enabled	bool	TRUE
product_management_enabled	bool	TRUE
allow_invite	bool	TRUE
workspace_key_support	bool	TRUE
workspace_max_keys	int	3
allowed_email_domains	string	
auto_discovery_method	string	scheduled
full_discovery_job_interval	int	48
cost_discovery_job_interval	int	24
describe_job_interval	int	8
health_check_job_interval	int	60
insight_job_interval	int	2
metrics_job_interval	int	2
compliance_job_interval	int	24
data_retention_duration	int	366
connection_limit	int	1000
user_limit	int	1000
asset_discovery_aws_policy_arns	string	arn:aws:iam::aws:policy/SecurityAudit,arn:aws:iam::aws:policy/ReadOnlyAccess
spend_discovery_aws_policy_arns	string	arn:aws:iam::aws:policy/AWSBillingReadOnlyAccess
asset_discovery_azure_role_ids	string	/subscriptions/%s/providers/Microsoft.Authorization/roleDefinitions/acdd72a7-3385-48ef-bd42-f606fba81ae7
spend_discovery_azure_role_ids	string	/subscriptions/%s/providers/Microsoft.Authorization/roleDefinitions/fa23ad8b-c56e-40d8-ac0c-ce449e1d2c64
aws_discovery_required_only	bool	true
azure_discovery_required_only	bool	true
asset_discovery_enabled	bool	true
spend_discovery_enabled	bool	true
customization_enabled	bool	true
analytics_git_url	string	https://github.com/kaytu-io/managed-platform-config
\.


--
-- Data for Name: query_parameters; Type: TABLE DATA; Schema: public; Owner: metadata_service
--

COPY public.query_parameters (key, value) FROM stdin;
azureAppTierTags	{}
azureAllowedVmSizes	
awsIamUserKeyRotateDays	30
awsTrustedEndpoints	
awsNetBiosTrustedIpRange	
azureStorageBlobSoftDeleteSufficientDays	1
awsRdsBaselineRestorableTimeInHrs	1
awsRdsInstanceDesiredClasses	
azureDatabaseTierTags	{}
awsEbsInstancesBackupPeriod	24
awsEbsAmiAgeMaxDays	30
azureSufficientDaysBeforeCertificateExpiry	30
awsBackupResourceTypeOptInPreference	{}
azureCmkSecretExpireDays	30
awsRdsBaselineRetentionPeriodDays	30
awsEcsContainerInstanceAgentVersion	1.0.0
awsSmtpTrustedIpRange	
awsBackupPlanMoveToColdStorageAfterDays	10
awsEksClusterLatestVersion	1.29
awsApprovedPermissionSets	
azureKubernetesLatestVersion	1.29
azureWebTierTags	{}
awsSshPublicKeyRotateDays	30
awsMysqlTrustedIpRange	
awsAppTierTags	{}
awsMongodbTrustedIpRange	
awsOracleTrustedIpRange	
awsLatestPolicies	
awsBackupPlanDeleteAfterDays	30
awsMssqlTrustedIpRange	
azureadClientSecretExpireDays	30
awsOpensearchTrustedIpRange	
awsIamUsersAuthorizedToEditPolicy	
azureLatestTlsVersion	1.3
azureAllowedVmExtentions	
azureSufficientDailyBackupRetention	1
awsCifsTrustedIpRange	1.4.0
awsEcsServicePlatformVersion	1.4.0
awsIamUserPasswordExpirationDays	30
awsEbsSnapshotAgeMaxDays	30
azureComputeSnapshotAgeMaxDays	30
azureAksLatestVersion	1.28.5
awsOpensearchLatestVersion	OpenSearch_2.11
awsWebTierTags	{}
awsEc2InstanceValidInstanceTypes	[]
azureDatabaseServerRetentionPeriodDays	30
awsIcmpTrustedIpRange	[]
awsApprovedIamUsers	[]
awsIamServerCertificateAge	90
awsIamAccessKeyAge	90
awsRpcTrustedIpRange	[]
awsUnapprovedIamPolicies	[]
azureAllowedKeyTypes	[]
azureRsaCertificateMinSize	2048
azureStorageAccountAllowedIPAddresses	[]
azureKeyVaultKeyExpirationDateDays	30
azureDiskSnapshotAgeThreshold	30
azureSufficientInstantRestoreRetention	30
kaytuMoMCostGrowthMinCost	100
kaytuMoMCostGrowthAllowedGrowth	0.15
kaytuConnectionMoMCostGrowthMinCost	1000
kaytuConnectionMoMCostGrowthAllowedGrowth	0.25
awsAccessanalyzerAnalyzerMandatoryTags	{}
awsApiGatewayStageMandatoryTags	{}
awsCloudfrontDistributionMandatoryTags	{}
awsCloudtrailTrailMandatoryTags	{}
awsCloudwatchAlarmMandatoryTags	{}
awsCloudwatchLogGroupMandatoryTags	{}
awsCodebuildProjectMandatoryTags	{}
awsCodecommitRepositoryMandatoryTags	{}
awsCodepipelinePipelineMandatoryTags	{}
awsConfigRuleMandatoryTags	{}
awsDaxClusterMandatoryTags	{}
awsDirectoryServiceDirectoryMandatoryTags	{}
awsDmsReplicationInstanceMandatoryTags	{}
awsDynamodbTableMandatoryTags	{}
awsEbsSnapshotMandatoryTags	{}
awsEbsVolumeMandatoryTags	{}
awsEc2ApplicationLoadBalancerMandatoryTags	{}
awsEc2ClassicLoadBalancerMandatoryTags	{}
awsEc2GatewayLoadBalancerMandatoryTags	{}
awsEc2InstanceMandatoryTags	{}
awsEc2NetworkLoadBalancerMandatoryTags	{}
awsEc2ReservedInstanceMandatoryTags	{}
awsEcrRepositoryMandatoryTags	{}
awsEcsContainerInstanceMandatoryTags	{}
awsEcsServiceMandatoryTags	{}
awsEfsFileSystemMandatoryTags	{}
awsEksAddonMandatoryTags	{}
awsEksClusterMandatoryTags	{}
awsEksIdentityProviderConfigMandatoryTags	{}
awsElasticBeanstalkApplicationMandatoryTags	{}
awsElasticBeanstalkEnvironmentMandatoryTags	{}
awsElasticacheClusterMandatoryTags	{}
awsElasticsearchDomainMandatoryTags	{}
awsEventbridgeRuleMandatoryTags	{}
awsGuarddutyDetectorMandatoryTags	{}
awsIamRoleMandatoryTags	{}
awsIamServerCertificateMandatoryTags	{}
awsIamUserMandatoryTags	{}
awsInspectorAssessmentTemplateMandatoryTags	{}
awsKinesisFirehoseDeliveryStreamMandatoryTags	{}
awsKmsKeyMandatoryTags	{}
awsLambdaFunctionMandatoryTags	{}
awsRdsDbClusterMandatoryTags	{}
awsRdsDbClusterParameterGroupMandatoryTags	{}
awsRdsDbClusterSnapshotMandatoryTags	{}
awsRdsDbInstanceMandatoryTags	{}
awsRdsDbOptionGroupMandatoryTags	{}
awsRdsDbParameterGroupMandatoryTags	{}
awsRdsDbSnapshotMandatoryTags	{}
awsRdsDbSubnetGroupMandatoryTags	{}
awsRedshiftClusterMandatoryTags	{}
awsRoute53DomainMandatoryTags	{}
awsRoute53ResolverEndpointMandatoryTags	{}
awsS3BucketMandatoryTags	{}
awsSagemakerEndpointConfigurationMandatoryTags	{}
awsSagemakerModelMandatoryTags	{}
awsSagemakerNotebookInstanceMandatoryTags	{}
awsSagemakerTrainingJobMandatoryTags	{}
awsSecretsmanagerSecretMandatoryTags	{}
awsSsmParameterMandatoryTags	{}
awsVpcEipMandatoryTags	{}
awsVpcMandatoryTags	{}
awsVpcNatGatewayMandatoryTags	{}
awsVpcNetworkAclMandatoryTags	{}
awsVpcSecurityGroupMandatoryTags	{}
awsVpcVpnConnectionMandatoryTags	{}
awsWafv2IpSetMandatoryTags	{}
awsWafv2RegexPatternSetMandatoryTags	{}
awsWafv2RuleGroupMandatoryTags	{}
awsWafv2WebAclMandatoryTags	{}
azureApiManagementMandatoryTags	{}
azureAppServiceEnvironmentMandatoryTags	{}
azureAppServiceFunctionAppMandatoryTags	{}
azureAppServicePlanMandatoryTags	{}
azureAppServiceWebAppMandatoryTags	{}
azureApplicationSecurityGroupMandatoryTags	{}
azureBatchAccountMandatoryTags	{}
azureComputeAvailabilitySetMandatoryTags	{}
azureComputeDiskEncryptionSetMandatoryTags	{}
azureComputeDiskMandatoryTags	{}
azureComputeImageMandatoryTags	{}
azureComputeSnapshotMandatoryTags	{}
azureComputeVirtualMachineMandatoryTags	{}
azureComputeVirtualMachineScaleSetMandatoryTags	{}
azureContainerRegistryMandatoryTags	{}
azureCosmosdbAccountMandatoryTags	{}
azureCosmosdbMongoDatabaseMandatoryTags	{}
azureCosmosdbSqlDatabaseMandatoryTags	{}
azureDataFactoryMandatoryTags	{}
azureDataLakeAnalyticsAccountMandatoryTags	{}
azureDataLakeStoreMandatoryTags	{}
azureEventhubNamespaceMandatoryTags	{}
azureExpressRouteCircuitMandatoryTags	{}
azureFirewallMandatoryTags	{}
azureIothubMandatoryTags	{}
azureKeyVaultDeletedVaultMandatoryTags	{}
azureKeyVaultKeyMandatoryTags	{}
azureKeyVaultManagedHardwareSecurityModuleMandatoryTags	{}
azureKeyVaultMandatoryTags	{}
azureKeyVaultSecretMandatoryTags	{}
azureKubernetesClusterMandatoryTags	{}
azureLbMandatoryTags	{}
azureLogAlertMandatoryTags	{}
azureLogProfileMandatoryTags	{}
azureLogicAppWorkflowMandatoryTags	{}
azureMariadbServerMandatoryTags	{}
azureMssqlElasticpoolMandatoryTags	{}
azureMssqlManagedInstanceMandatoryTags	{}
azureMysqlServerMandatoryTags	{}
azureNetworkInterfaceMandatoryTags	{}
azureNetworkSecurityGroupMandatoryTags	{}
azureNetworkWatcherFlowLogMandatoryTags	{}
azureNetworkWatcherMandatoryTags	{}
azurePostgresqlServerMandatoryTags	{}
azurePublicIpMandatoryTags	{}
azureRecoveryServicesVaultMandatoryTags	{}
azureRedisCacheMandatoryTags	{}
azureRouteTableMandatoryTags	{}
azureSearchServiceMandatoryTags	{}
azureServicebusNamespaceMandatoryTags	{}
azureSqlDatabaseMandatoryTags	{}
azureSqlServerMandatoryTags	{}
azureStorageAccountMandatoryTags	{}
azureStreamAnalyticsJobMandatoryTags	{}
azureVirtualNetworkGatewayMandatoryTags	{}
azureVirtualNetworkMandatoryTags	{}
azureSubscriptionMandatoryTags	{}
\.


--
-- Name: config_metadata config_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: metadata_service
--

ALTER TABLE ONLY public.config_metadata
    ADD CONSTRAINT config_metadata_pkey PRIMARY KEY (key);


--
-- Name: query_parameters query_parameters_pkey; Type: CONSTRAINT; Schema: public; Owner: metadata_service
--

ALTER TABLE ONLY public.query_parameters
    ADD CONSTRAINT query_parameters_pkey PRIMARY KEY (key);


--
-- PostgreSQL database dump complete
--

