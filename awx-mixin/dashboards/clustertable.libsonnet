{
  new(datasource, dashboardUid):: {
    type: 'table',
    title: 'Cluster List',
    description: 'List of available clusters with counts of cluster level objects. Selectable by the "instance" variable.',
    datasource: datasource,
    links: [],
    fieldConfig: {
      defaults: {
        custom: {
          align: 'auto',
          displayMode: 'auto',
          minWidth: 90,
        },
        thresholds: {
          mode: 'absolute',
          steps: [],
        },
        mappings: [],
        color: {
          mode: 'continuous-blues',
        },
        links: [],
        unit: 'none',
      },
      overrides: [
        {
          matcher: {
            id: 'byName',
            options: 'Instance',
          },
          properties: [
            {
              id: 'links',
              value: [
                {
                  title: '',
                  url: 'd/' + dashboardUid + '/var-datasource=${datasource}&var-job=${job}&var-instance=${__data.fields.Instance}',
                },
              ],
            },
          ],
        },
      ],
    },
    options: {
      showHeader: true,
      footer: {
        show: false,
        reducer: [
          'sum',
        ],
        fields: '',
      },
    },
    targets: [
      {
        expr: 'awx_organizations_total{job=~"$job", instance="$instance"}',
        legendFormat: 'Orgs',
        interval: '',
        exemplar: false,
        format: 'table',
        intervalFactor: 2,
        refId: 'A',
        instant: true,
      },
      {
        expr: 'awx_teams_total{job=~"$job", instance="$instance"}',
        legendFormat: 'Teams',
        interval: '',
        exemplar: false,
        format: 'table',
        intervalFactor: 2,
        refId: 'B',
        instant: true,
      },
      {
        expr: 'awx_users_total{job=~"$job", instance="$instance"}',
        legendFormat: 'Users',
        interval: '',
        exemplar: false,
        format: 'table',
        intervalFactor: 2,
        refId: 'C',
        instant: true,
      },
      {
        expr: 'awx_inventories_total{job=~"$job", instance="$instance"}',
        legendFormat: 'Inventories',
        interval: '',
        exemplar: false,
        format: 'table',
        intervalFactor: 2,
        refId: 'D',
        instant: true,
      },
      {
        expr: 'awx_projects_total{job=~"$job", instance="$instance"}',
        legendFormat: 'Projects',
        interval: '',
        exemplar: false,
        format: 'table',
        intervalFactor: 2,
        refId: 'E',
        instant: true,
      },
      {
        expr: 'awx_schedules_total{job=~"$job", instance="$instance"}',
        legendFormat: 'Schedules',
        interval: '',
        exemplar: false,
        format: 'table',
        intervalFactor: 2,
        refId: 'F',
        instant: true,
      },
    ],
    transformations: [
      {
        id: 'seriesToColumns',
        options: {
          byField: 'instance',
        },
      },
      {
        id: 'organize',
        options: {
          excludeByName: {
            'Time 1': true,
            '__name__ 1': true,
            'cluster 1': true,
            'job 1': true,
            'Time 2': true,
            'cluster 2': true,
            'job 2': true,
            '__name__ 2': true,
            'Time 3': true,
            '__name__ 3': true,
            'cluster 3': true,
            'job 3': true,
            'Time 4': true,
            'cluster 4': true,
            'job 4': true,
            '__name__ 4': true,
            'Time 5': true,
            '__name__ 5': true,
            'cluster 5': true,
            'job 5': true,
            'Time 6': true,
            '__name__ 6': true,
            'cluster 6': true,
            'job 6': true,
          },
          indexByName: {},
          renameByName: {
            'Value #A': 'Organizations',
            instance: 'Instance',
            'cluster 2': '',
            'Value #B': 'Teams',
            'Time 3': '',
            'Value #C': 'Users',
            'Time 4': '',
            'Value #D': 'Inventories',
            'Time 5': '',
            'Value #E': 'Projects',
            '__name__ 5': '',
            'cluster 6': '',
            'Value #F': 'Schedules',
          },
        },
      },
    ],
  },
}
