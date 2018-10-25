<?php

/**
 * 411 configuration file
 *
 * Rename this to 'config.php' and modify.
 */
$config = [];

/**
 * Authentication configuration
 */
$config['auth'] = [
    'proxy' => [
        /**
         * Whether to enable proxy auth.
         * IT IS VERY INSECURE TO ENABLE THIS IF 411 is not run behind an auth proxy.
         */
        'enabled' => false,
        /**
         * The name of the header the proxy is setting.
         */
        'header' => null,
        /**
         * Whether to automatically create users who are authenticated.
         */
        'auto_create' => false,
        /**
         * Email domain for automatically created users.
         */
        'domain' => null,
    ],
    'api' => [
        /**
         * Whether to enable api access to 411.
         */
        'enabled' => true
    ]
];

/**
 * Database configuration
 */
$config['db'] = [
    /**
     * A PDO compatible DSN.
     */

    'dsn' => 'mysql:host=411db;dbname=' . getenv('MYSQL_DATABASE'),
    /**
     * The user name for connecting to the database.
     */
    'user' => getenv('MYSQL_USER'),
    /**
     * The password for connecting to the database. Optional if the PDO driver doesn't
     * require a password.
     */
    'pass' => getenv('MYSQL_PASSWORD'),
];


/****
 *
 * Search type configuration
 * Note: All hostnames should specify protocol!
 *
 ***/

/**
 * Elasticsearch search type
 */
$config['elasticsearch'] = [
    /**
     * Each entry in this array represents an Elasticsearch source that 411 can query.
     *
     * 'hosts': An array of hosts powering your ES cluster.
     * 'index_hosts': An array of hosts to use for indexing (if different from 'hosts').
     * 'ssl_cert': Path to an ssl certificate if your cluster uses HTTPS.
     * 'index': The index to query. Leave as null to query all indices.
     *          If the index is date_based, accepts index patterns. (Otherwise, it's taken literally)
     *          Any characters wrapped by [] will be taken literally.
     *          All other characters are interpretted via PHP's date formatting syntax.
     *          See https://secure.php.net/manual/en/function.date.php for details.
     * 'date_based': Whether to generate an index name according to a date-based index pattern.
     * 'date_interval': If the index is date_based, this defines the indexing pattern interval.
     *                  'h' - Hourly.
     *                  'd' - Daily.
     *                  'w' - Weekly.
     *                  'm' - Monthly.
     *                  'y' - Yearly.
     * 'date_field': The field to use for doing date-based queries.
     * 'date_type': The format of the date field.
     *              null - Automatically detect and parse. Should work most of the time!
     *              '@' - Parse as a UNIX timestamp.
     *              '#' - Parse as a UNIX timestamps (in milliseconds).
     *              All other strings are interpretted via PHP's date formatting syntax.
     * 'src_url': A format string for generating default source links.
     *            Requires the following format specifiers: 's', 'd', 'd'.
     *            Ex: 'https://localhost/?query=%s&from=%d&to=%d'
     */

    # Configuration for the 411 Alerts index.
    'alerts' => [
        'hosts' => ['http://elasticsearch:9200'],
        'index_hosts' => [],
        'ssl_cert' => null,
        'index' => null,
        'date_based' => false,
        'date_interval' => null,
        'date_field' => 'alert_date',
        'date_type' => null,
        'src_url' => null,
    ],
    # Configuration for the Apache index that 411 queries.
    'apache2' => [
        'hosts' => ['http://elasticsearch:9200'],
        'index_hosts' => [],
        'ssl_cert' => null,
        'index' => '[apache-]Y.m.d',
        'date_based' => true,
        'date_interval' => 'd',
        'date_field' => '@timestamp',
        'date_type' => null,
        'src_url' => null,
    ],
    # Configuration for the Apache index that 411 queries.
    'catchall' => [
        'hosts' => ['http://elasticsearch:9200'],
        'index_hosts' => [],
        'ssl_cert' => null,
        'index' => '[catchall-]Y.m.d',
        'date_based' => true,
        'date_interval' => 'd',
        'date_field' => '@timestamp',
        'date_type' => null,
        'src_url' => null,
    ],
    # Configuration for the logstash index that 411 queries.
    'metricbeat' => [
        'hosts' => ['http://elasticsearch:9200'],
        'index_hosts' => [],
        'ssl_cert' => null,
        'index' => '[metricbeat-6.4.0-]Y.m.d',
        'date_based' => true,
        'date_interval' => 'd',
        'date_field' => '@timestamp',
        'date_type' => null,
        'src_url' => null,
    ],
    # Configuration for the logstash index that 411 queries.
    'winlogbeat' => [
        'hosts' => ['http://elasticsearch:9200'],
        'index_hosts' => [],
        'ssl_cert' => null,
        'index' => '[winlogbeat-6.4.0-]Y.m.d',
        'date_based' => true,
        'date_interval' => 'd',
        'date_field' => '@timestamp',
        'date_type' => null,
        'src_url' => null,
    ],
];

/**
 * Graphite
 *
 * Configure to allow querying Graphite.
 */
$config['graphite'] = [
    /**
     * Each entry in this array represents a Graphite source that 411 can query.
     *
     * 'host': The hostname for your Graphite instance.
     */
    'graphite' => [
        'host' => null,
    ],
];


/**
 * Notifications
 *
 * Configure to set how alerts are sent.
 */
$config['notifications'] = [
    # Engine can be 'sendmail', 'smtp', log', or 'none'
    # 'sendmail' uses the sendmail functionality on the 411 server
    # 'smtp' sends email using SMTP through a separate server
    # 'log' appends messages to a logfile without sending
    # 'none' does not attempt to send messages at all **TO COME**
    'engine' => 'log',

    # Format
    # Can be 'html' or 'text'
    'format' => 'text',

    # sendmail settings
    # *NONE*

    # phpmailer settings
    'smtp' => [
        'server'   => 'smtp.host.com',
        'username' => 'smtpuser@gmail.com',
        'password' => 'your super strong password here',
        'port'     => '587',
        'replyname'     => '411 Administrator',
        'replyaddress'  => '411@alerts.com',
    ],
    # logfile settings
    'log' => [
        'path' => '/tmp',
        'file' => '411.log',
    ],
];


/**
 * ThreatExchange
 * See https://developers.facebook.com/products/threat-exchange for details.
 *
 * Configure to allow querying ThreatExchange.
 */
$config['threatexchange'] = [
    /**
     * The api token for connecting to ThreatExchange.
     */
    'api_token' => null,
    /**
     * The api secret for connecting to ThreatExchange.
     */
    'api_secret' => null,
];


/****
 *
 * Target configuration
 *
 ***/

/**
 * Jira
 *
 * Fill in to enable Jira integration.
 */
$config['jira'] = [
    /**
     * The hostname for your Jira instance.
     */
    'host' => null,
    /**
     * The username for connecting to Jira.
     */
    'user' => null,
    /**
     * The password for connecting to Jira.
     */
    'pass' => null,
];

/**
 * Slack
 *
 * Fill in to enable Slack integration.
 */
$config['slack'] = [
    /**
     * A webhook url to push Alerts to.
     * See https://api.slack.com/incoming-webhooks for details.
     */
    'webhook_url' => null
];
