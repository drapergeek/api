namespace :sample do
  desc 'Reset Auto Increment Ids'
  task reset: :environment do
    Alert.connection.execute('ALTER SEQUENCE alerts_id_seq RESTART 1')
    Order.connection.execute('ALTER SEQUENCE orders_id_seq RESTART 1')
    OrderItem.connection.execute('ALTER SEQUENCE order_items_id_seq RESTART 1')
    Project.connection.execute('ALTER SEQUENCE projects_id_seq RESTART 1')
    Product.connection.execute('ALTER SEQUENCE products_id_seq RESTART 1')
    Staff.connection.execute('ALTER SEQUENCE staff_id_seq RESTART 1')
  end

  desc 'Generates demo data'
  task demo: :environment do
    Staff.create!([
       { id: 4, first_name: "Unused", last_name: "Staff", email: "unused@projectjellyfish.org", phone: nil, password: "jellyfish", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, role: 0, deleted_at: nil, secret: 'jellyfish-token'},
       { id: 2, first_name: "ManageIQ", last_name: "Staff", email: "miq@projectjellyfish.org", phone: nil, password: "jellyfish", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 17, current_sign_in_at: "2015-02-06 17:04:10", last_sign_in_at: "2015-02-06 16:57:41", current_sign_in_ip: "54.172.90.47", last_sign_in_ip: "54.172.90.47", role: 1, deleted_at: nil, secret: 'jellyfish-token'},
       { id: 3, first_name: "User", last_name: "Staff", email: "user@projectjellyfish.org", phone: nil, password: "jellyfish", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 4, current_sign_in_at: "2015-02-13 18:00:54", last_sign_in_at: "2015-02-12 19:37:15", current_sign_in_ip: "128.229.4.2", last_sign_in_ip: "128.229.4.2", role: 0, deleted_at: nil, secret: 'jellyfish-token'},
       { id: 5, first_name: "All", last_name: "Users", email: "projectjellyfish@bah.com", phone: nil, password: "jellyfish", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, role: 0, deleted_at: nil, secret: 'jellyfish-token'},
       { id: 1, first_name: "Admin", last_name: "Staff", email: "admin@projectjellyfish.org", phone: nil, password: "jellyfish", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 36, current_sign_in_at: "2015-02-18 00:39:32", last_sign_in_at: "2015-02-17 20:28:51", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "108.45.125.67", role: 1, deleted_at: nil, secret: 'jellyfish-token'}
    ])
    Staff.connection.execute("ALTER SEQUENCE staff_id_seq RESTART #{Staff.all.order('id DESC').first.id + 1}")

    Cloud.create!([
       { id: 1, name: "AWS", description: nil, extra: "{}", deleted_at: nil},
       { id: 2, name: "Azure", description: nil, extra: "{}", deleted_at: nil},
       { id: 3, name: "Rackspace", description: nil, extra: "{}", deleted_at: nil},
       { id: 4, name: "VMware", description: nil, extra: nil, deleted_at: nil},
       { id: 5, name: "Google", description: nil, extra: nil, deleted_at: nil},
       { id: 6, name: "Other", description: nil, extra: nil, deleted_at: nil},
       { id: 7, name: "OpenStack", description: nil, extra: nil, deleted_at: nil}
    ])
    Cloud.connection.execute("ALTER SEQUENCE clouds_id_seq RESTART #{Cloud.all.order('id DESC').first.id + 1}")

    ManageIqProduct.create!([
       { id: 1, service_type_id: 8, service_catalog_id: 1, cloud_id: 1, chef_role: "--CHEF-ROLE--", options: {} },
       { id: 2, service_type_id: 8, service_catalog_id: 1, cloud_id: 1, chef_role: "--CHEF-ROLE--", options: {} },
       { id: 3, service_type_id: 8, service_catalog_id: 1, cloud_id: 1, chef_role: "--CHEF-ROLE--", options: {} },
       { id: 5, service_type_id: 3, service_catalog_id: 1, cloud_id: 1, chef_role: "--CHEF-ROLE--", options: {} },
       { id: 6, service_type_id: 3, service_catalog_id: 1, cloud_id: 1, chef_role: "--CHEF-ROLE--", options: {} },
       { id: 7, service_type_id: 3, service_catalog_id: 1, cloud_id: 1, chef_role: "--CHEF-ROLE--", options: {} },
       { id: 8, service_type_id: 3, service_catalog_id: 1, cloud_id: 1, chef_role: "--CHEF-ROLE--", options: {} },
       { id: 9, service_type_id: 3, service_catalog_id: 1, cloud_id: 1, chef_role: "--CHEF-ROLE--", options: {} },
       { id: 11, service_type_id: 5, service_catalog_id: 1, cloud_id: 1, chef_role: "--CHEF-ROLE--", options: {} },
       { id: 4, service_type_id: 3, service_catalog_id: 1, cloud_id: 1, chef_role: "--CHEF-ROLE--", options: {} },
       { id: 16, service_type_id: 0, service_catalog_id: 0, cloud_id: 1, chef_role: "0" },
       { id: 17, service_type_id: 0, service_catalog_id: 0, cloud_id: 4, chef_role: "0" },
       { id: 18, service_type_id: 0, service_catalog_id: 0, cloud_id: 1, chef_role: "0" },
       { id: 19, service_type_id: 0, service_catalog_id: 0, cloud_id: 4, chef_role: "0" },
       { id: 20, service_type_id: 0, service_catalog_id: 0, cloud_id: 6, chef_role: "0" },
       { id: 21, service_type_id: 0, service_catalog_id: 0, cloud_id: 6, chef_role: "0" },
       { id: 22, service_type_id: 0, service_catalog_id: 0, cloud_id: 6, chef_role: "0" },
       { id: 23, service_type_id: 0, service_catalog_id: 0, cloud_id: 4, chef_role: "0" },
       { id: 24, service_type_id: 0, service_catalog_id: 0, cloud_id: 6, chef_role: "0" },
       { id: 25, service_type_id: 0, service_catalog_id: 0, cloud_id: 6, chef_role: "0" },
       { id: 26, service_type_id: 0, service_catalog_id: 0, cloud_id: 6, chef_role: "0" },
       { id: 10, service_type_id: 5, service_catalog_id: 1, cloud_id: 1, chef_role: "--CHEF-ROLE--", options: {} },
       { id: 28, service_type_id: 0, service_catalog_id: 0, cloud_id: 6, chef_role: "0", options: nil },
       { id: 31, service_type_id: 0, service_catalog_id: 0, cloud_id: 4, chef_role: "--CHEF-ROLE--", options: nil },
       { id: 32, service_type_id: 0, service_catalog_id: 0, cloud_id: 4, chef_role: "--CHEF-ROLE--", options: nil },
       { id: 30, service_type_id: 0, service_catalog_id: 0, cloud_id: 4, chef_role: "--CHEF-ROLE--", options: nil },
       { id: 33, service_type_id: 0, service_catalog_id: 0, cloud_id: 7, chef_role: "--CHEF-ROLE--", options: nil },
       { id: 34, service_type_id: 0, service_catalog_id: 0, cloud_id: 2, chef_role: "0", options: nil },
       { id: 27, service_type_id: 0, service_catalog_id: 0, cloud_id: 6, chef_role: "0", options: nil },
       { id: 29, service_type_id: 0, service_catalog_id: 0, cloud_id: 1, chef_role: "0", options: nil }
    ])
    ManageIqProduct.connection.execute("ALTER SEQUENCE manage_iq_products_id_seq RESTART #{ManageIqProduct.all.order('id DESC').first.id + 1}")

    Product.create!([
       { id: 1, name: "Small", description: "Small EC2 Instance", active: true, img: "products/aws_ec2.png", deleted_at: nil, product_type_id: 1, setup_price: "1.99", hourly_price: "0.001", monthly_price: "0.05", provisionable_id: 1, provisionable_type: 'ManageIqProduct' },
       { id: 2, name: "Medium", description: "Medium EC2 Instance", active: true, img: "products/aws_ec2.png", deleted_at: nil, product_type_id: 1, setup_price: "2.99", hourly_price: "0.0025", monthly_price: "0.075", provisionable_id: 2, provisionable_type: 'ManageIqProduct' },
       { id: 3, name: "Large", description: "Large EC2 Instance", active: true, img: "products/aws_ec2.png", deleted_at: nil, product_type_id: 1, setup_price: "3.99", hourly_price: "0.0055", monthly_price: "0.12", provisionable_id: 3, provisionable_type: 'ManageIqProduct' },
       { id: 5, name: "Medium MySQL", description: "Medium MySQL", active: true, img: "products/aws_rds.png", deleted_at: nil, product_type_id: 3, setup_price: "1.99", hourly_price: "0.004", monthly_price: "0.1", provisionable_id: 5, provisionable_type: 'ManageIqProduct' },
       { id: 6, name: "Medium PostgreSQL", description: "Medium PostgreSQL", active: true, img: "products/aws_rds.png", deleted_at: nil, product_type_id: 3, setup_price: "2.99", hourly_price: "0.004", monthly_price: "0.25", provisionable_id: 6, provisionable_type: 'ManageIqProduct' },
       { id: 7, name: "Large PostgreSQL", description: "Large PostgreSQL", active: true, img: "products/aws_rds.png", deleted_at: nil, product_type_id: 3, setup_price: "3.99", hourly_price: "0.009", monthly_price: "0.5", provisionable_id: 7, provisionable_type: 'ManageIqProduct' },
       { id: 8, name: "Medium Aurora", description: "Medium Aurora", active: true, img: "products/aws_rds.png", deleted_at: nil, product_type_id: 3, setup_price: "4.99", hourly_price: "0.015", monthly_price: "0.95", provisionable_id: 8, provisionable_type: 'ManageIqProduct' },
       { id: 9, name: "Large SQL Server", description: "Large SQL Server", active: true, img: "products/aws_rds.png", deleted_at: nil, product_type_id: 3, setup_price: "5.99", hourly_price: "0.025", monthly_price: "1.29", provisionable_id: 9, provisionable_type: 'ManageIqProduct' },
       { id: 11, name: "West Coast Storage", description: "Normal, Northern California", active: true, img: "products/aws_s3.png", deleted_at: nil, product_type_id: 4, setup_price: "0.99", hourly_price: "0.001", monthly_price: "0.05", provisionable_id: 11, provisionable_type: 'ManageIqProduct' },
       { id: 4, name: "Small MySQL", description: "Small MySQL", active: true, img: "products/aws_rds.png", deleted_at: nil, product_type_id: 3, setup_price: "1.0", hourly_price: "1.0", monthly_price: "1.0", provisionable_id: 4, provisionable_type: 'ManageIqProduct' },
       { id: 16, name: "LAMP Stack", description: "Linux, Apache, MySQL, PHP", active: true, img: "products/php.png", deleted_at: nil, product_type_id: 5, setup_price: "10.0", hourly_price: "10.0", monthly_price: "10.0", provisionable_id: 16, provisionable_type: 'ManageIqProduct' },
       { id: 17, name: "LAMP Stack", description: "Linux, Apache, MySQL, PHP", active: true, img: "products/php.png", deleted_at: nil, product_type_id: 5, setup_price: "20.0", hourly_price: "20.0", monthly_price: "20.0", provisionable_id: 17, provisionable_type: 'ManageIqProduct' },
       { id: 18, name: "Rails Stack", description: "Ruby on Rails Stack", active: true, img: "products/rails.png", deleted_at: nil, product_type_id: 5, setup_price: "10.0", hourly_price: "10.0", monthly_price: "10.0", provisionable_id: 18, provisionable_type: 'ManageIqProduct' },
       { id: 19, name: "MEAN Stack", description: "MongoDB, ExpressJS, AngularJS, NodeJS.", active: true, img: "products/mean.png", deleted_at: nil, product_type_id: 5, setup_price: "10.0", hourly_price: "10.0", monthly_price: "10.0", provisionable_id: 19, provisionable_type: 'ManageIqProduct' },
       { id: 20, name: "Sr. Java Developer", description: "", active: true, img: "products/woman.png", deleted_at: nil, product_type_id: 7, setup_price: "10.0", hourly_price: "10.0", monthly_price: "10.0", provisionable_id: 20, provisionable_type: 'ManageIqProduct' },
       { id: 21, name: "Sr. System Administrator", description: "Sr. System Administrator", active: true, img: "products/woman.png", deleted_at: nil, product_type_id: 7, setup_price: "10.0", hourly_price: "10.0", monthly_price: "10.0", provisionable_id: 21, provisionable_type: 'ManageIqProduct' },
       { id: 22, name: "Project Manager", description: "Project Manager", active: true, img: "products/man.png", deleted_at: nil, product_type_id: 7, setup_price: "10.0", hourly_price: "10.0", monthly_price: "10.0", provisionable_id: 22, provisionable_type: 'ManageIqProduct' },
       { id: 23, name: "JIRA Project", description: "A project in corporate JIRA instance.", active: true, img: "products/jira.png", deleted_at: nil, product_type_id: 6, setup_price: "10.0", hourly_price: "10.0", monthly_price: "10.0", provisionable_id: 23, provisionable_type: 'ManageIqProduct' },
       { id: 24, name: "Confluence Project", description: "Confluence Project", active: true, img: "products/confluence.png", deleted_at: nil, product_type_id: 6, setup_price: "10.0", hourly_price: "10.0", monthly_price: "10.0", provisionable_id: 24, provisionable_type: 'ManageIqProduct' },
       { id: 25, name: "Bugzilla Instance", description: "Bugzilla Instance", active: true, img: "products/bugzilla.png", deleted_at: nil, product_type_id: 6, setup_price: "10.0", hourly_price: "10.0", monthly_price: "10.0", provisionable_id: 25, provisionable_type: 'ManageIqProduct' },
       { id: 26, name: "1GB NetApps Storage", description: "NetApps Storage", active: true, img: "products/netapp.png", deleted_at: nil, product_type_id: 4, setup_price: "10.0", hourly_price: "10.0", monthly_price: "10.0", provisionable_id: 26, provisionable_type: 'ManageIqProduct' },
       { id: 10, name: "S3 Storage", description: "", active: true, img: "products/aws_s3.png", deleted_at: nil, product_type_id: 4, setup_price: "1.0", hourly_price: "1.0", monthly_price: "1.0", provisionable_id: 10, provisionable_type: 'ManageIqProduct' },
       { id: 28, name: "Teradata", description: "Teradata", active: true, img: "products/teradata.png", deleted_at: nil, product_type_id: 2, setup_price: "10.0", hourly_price: "10.0", monthly_price: "10.0", provisionable_id: 28, provisionable_type: 'ManageIqProduct' },
       { id: 31, name: "RHEL 6 Large ", description: "Large RHEL 6 Instance", active: true, img: "products/redhat.png", deleted_at: nil, product_type_id: 1, setup_price: "10.0", hourly_price: "10.0", monthly_price: "10.0", provisionable_id: 31, provisionable_type: 'ManageIqProduct' },
       { id: 32, name: "RHEL 6 Medium", description: "RHEL 6 Medium", active: true, img: "products/redhat.png", deleted_at: nil, product_type_id: 1, setup_price: "10.0", hourly_price: "10.0", monthly_price: "10.0", provisionable_id: 32, provisionable_type: 'ManageIqProduct' },
       { id: 30, name: "RHEL 6 Small ", description: "Small RHEL 6 Instance", active: true, img: "products/redhat.png", deleted_at: nil, product_type_id: 1, setup_price: "10.0", hourly_price: "10.0", monthly_price: "10.0", provisionable_id: 30, provisionable_type: 'ManageIqProduct' },
       { id: 33, name: "Apache Web Server ", description: "Apache Web Server", active: true, img: "products/apache.png", deleted_at: nil, product_type_id: 1, setup_price: "10.0", hourly_price: "10.0", monthly_price: "10.0", provisionable_id: 33, provisionable_type: 'ManageIqProduct' },
       { id: 34, name: "MS Exchange Server", description: "MS Exchange Server", active: true, img: "products/exchange.png", deleted_at: nil, product_type_id: 5, setup_price: "10.0", hourly_price: "10.0", monthly_price: "10.0", provisionable_id: 34, provisionable_type: 'ManageIqProduct' },
       { id: 27, name: "100 Node Hadoop Cluster", description: nil, active: true, img: "products/hadoop.png", deleted_at: nil, product_type_id: 2, setup_price: "10.0", hourly_price: "10.0", monthly_price: "10.0", provisionable_id: 27, provisionable_type: 'ManageIqProduct' },
       { id: 29, name: "10 Node Hadoop Cluster", description: nil, active: true, img: "products/hadoop.png", deleted_at: nil, product_type_id: 2, setup_price: "10.0", hourly_price: "10.0", monthly_price: "10.0", provisionable_id: 29, provisionable_type: 'ManageIqProduct' }
    ])
    Product.connection.execute("ALTER SEQUENCE products_id_seq RESTART #{Product.all.order('id DESC').first.id + 1}")

    ProductAnswer.create!([
       { id: 1, product_id: 1, product_type_question_id: 1, answer: "t2.micro"},
       { id: 2, product_id: 1, product_type_question_id: 2, answer: "20"},
       { id: 3, product_id: 2, product_type_question_id: 1, answer: "m3.medium"},
       { id: 4, product_id: 2, product_type_question_id: 2, answer: "40"},
       { id: 5, product_id: 3, product_type_question_id: 1, answer: "m3.large"},
       { id: 6, product_id: 3, product_type_question_id: 2, answer: "80"},
       { id: 7, product_id: 4, product_type_question_id: 6, answer: "db.m3.medium"},
       { id: 8, product_id: 4, product_type_question_id: 7, answer: "mysql"},
       { id: 9, product_id: 4, product_type_question_id: 8, answer: "20"},
       { id: 11, product_id: 5, product_type_question_id: 6, answer: "db.m3.medium"},
       { id: 12, product_id: 5, product_type_question_id: 7, answer: "mysql"},
       { id: 13, product_id: 5, product_type_question_id: 8, answer: "40"},
       { id: 14, product_id: 5, product_type_question_id: 9, answer: "magnetic"},
       { id: 15, product_id: 6, product_type_question_id: 6, answer: "db.m3.medium"},
       { id: 16, product_id: 6, product_type_question_id: 7, answer: "posgresql"},
       { id: 17, product_id: 6, product_type_question_id: 8, answer: "40"},
       { id: 18, product_id: 6, product_type_question_id: 9, answer: "ssd"},
       { id: 19, product_id: 7, product_type_question_id: 6, answer: "db.m3.large"},
       { id: 20, product_id: 7, product_type_question_id: 7, answer: "postgresql"},
       { id: 21, product_id: 7, product_type_question_id: 8, answer: "120"},
       { id: 22, product_id: 7, product_type_question_id: 9, answer: "ssd"},
       { id: 23, product_id: 8, product_type_question_id: 6, answer: "db.m3.medium"},
       { id: 24, product_id: 8, product_type_question_id: 7, answer: "aurora"},
       { id: 25, product_id: 8, product_type_question_id: 8, answer: "40"},
       { id: 26, product_id: 8, product_type_question_id: 9, answer: "magnetic"},
       { id: 27, product_id: 9, product_type_question_id: 6, answer: "db.m3.xlarge"},
       { id: 28, product_id: 9, product_type_question_id: 7, answer: "sqlserver"},
       { id: 29, product_id: 9, product_type_question_id: 8, answer: "120"},
       { id: 30, product_id: 9, product_type_question_id: 9, answer: "ssd"},
       { id: 31, product_id: 10, product_type_question_id: 10, answer: "normal"},
       { id: 33, product_id: 11, product_type_question_id: 10, answer: "normal"},
       { id: 34, product_id: 11, product_type_question_id: 11, answer: "us-west-1"},
       { id: 35, product_id: 12, product_type_question_id: 10, answer: "normal"},
       { id: 36, product_id: 12, product_type_question_id: 11, answer: "us-west-2"},
       { id: 37, product_id: 13, product_type_question_id: 10, answer: "reduced"},
       { id: 38, product_id: 13, product_type_question_id: 11, answer: ""},
       { id: 39, product_id: 14, product_type_question_id: 10, answer: "reduced"},
       { id: 40, product_id: 14, product_type_question_id: 11, answer: "us-west-1"},
       { id: 41, product_id: 15, product_type_question_id: 10, answer: "reduced"},
       { id: 42, product_id: 15, product_type_question_id: 11, answer: "us-west-2"},
       { id: 10, product_id: 4, product_type_question_id: 9, answer: "standard"},
       { id: 43, product_id: 26, product_type_question_id: 10, answer: "normal"},
       { id: 44, product_id: 26, product_type_question_id: 11, answer: "us-west-1"},
       { id: 32, product_id: 10, product_type_question_id: 11, answer: "us-west-2"},
       { id: 45, product_id: 27, product_type_question_id: 3, answer: "4"},
       { id: 46, product_id: 27, product_type_question_id: 4, answer: "40"},
       { id: 47, product_id: 27, product_type_question_id: 5, answer: "2"},
       { id: 48, product_id: 28, product_type_question_id: 3, answer: "4"},
       { id: 49, product_id: 28, product_type_question_id: 4, answer: "40"},
       { id: 50, product_id: 28, product_type_question_id: 5, answer: "2"},
       { id: 51, product_id: 29, product_type_question_id: 3, answer: "4"},
       { id: 52, product_id: 29, product_type_question_id: 4, answer: "40"},
       { id: 53, product_id: 29, product_type_question_id: 5, answer: "1"}
    ])
    ProductAnswer.connection.execute("ALTER SEQUENCE product_answers_id_seq RESTART #{ProductAnswer.all.order('id DESC').first.id + 1}")

    def parse_questions(file)
      JSON.parse(
        File.read(
          Jellyfish::Fog::AWS::Engine.root.join(
            *%w(config product_questions #{file}.json)
          )
        )
      )
    end

    ProductType.create!([
       { id: 1, name: "Infrastructure", description: "Available Infrastructure", provisioning_answers: parse_questions('infrastructure-miq') },
       { id: 5, name: "Platforms", description: "Available Platforms\n"},
       { id: 3, name: "Databases", description: "Available Database", provisioning_answers: parse_questions('databases-miq') },
       { id: 4, name: "Storage", description: "Available Storage", provisioning_answers: parse_questions('storage-miq') },
       { id: 2, name: "Big Data", description: "Available Big Data Solutions", provisioning_answers: parse_questions('big_data-miq') },
       { id: 6, name: "Applications", description: "Available Applications"},
       { id: 7, name: "Staff", description: "Available Staff"}
    ])
    ProductType.connection.execute("ALTER SEQUENCE product_types_id_seq RESTART #{ProductType.all.order('id DESC').first.id + 1}")

    ProductTypeQuestion.create!([
       { id: 1, product_type_id: 1, label: "Instance Size", field_type: "select", placeholder: "", help: "", options: [["t2.micro", "t2.micro"], ["m3.medium", "m3.medium"], ["m3.large", "m3.large"]], default: "m3.medium", required: true, load_order: 0, manageiq_key: "instance_size"},
       { id: 2, product_type_id: 1, label: "Disk Size", field_type: "text", placeholder: "Size in GBs", help: "", default: "40", required: true, load_order: 1, manageiq_key: "disk_size"},
       { id: 3, product_type_id: 2, label: "RAM", field_type: "text", placeholder: "Size in GBs", help: "", default: "4", required: true, load_order: 0, manageiq_key: "ram_size"},
       { id: 4, product_type_id: 2, label: "Disk Size", field_type: "text", placeholder: "Size in GBs", help: "", default: "40", required: true, load_order: 1, manageiq_key: "disk_size"},
       { id: 5, product_type_id: 2, label: "CPU", field_type: "select", placeholder: "", help: "", options: [["1", "1 CPU"], ["2", "2 CPUs"], ["4", "4 CPUs"], ["6", "6 CPUs"], ["8", "8 CPUs"]], default: "1", required: true, load_order: 2, manageiq_key: "cpu_count"},
       { id: 6, product_type_id: 3, label: "Instance Size", field_type: "select", placeholder: "", help: "", options: [["db.m3.medium", "db.m3.medium"], ["db.m3.large", "db.m3.large"], ["db.m3.xlarge", "db.m3.xlarge"]], default: "db.m3.medium", required: true, load_order: 0, manageiq_key: "db_instance_class"},
       { id: 7, product_type_id: 3, label: "DB Engine", field_type: "select", placeholder: "", help: "", options: [["aurora", "Aurora"], ["mysql", "MySQL"], ["postgresql", "PostgreSQL"], ["sqlserver", "SQL Server"]], default: "", required: true, load_order: 1, manageiq_key: "engine"},
       { id: 8, product_type_id: 3, label: "Disk Size", field_type: "text", placeholder: "Size in GBs", help: "", default: "40", required: true, load_order: 2, manageiq_key: "allocated_storage"},
       { id: 9, product_type_id: 3, label: "Storage Type", field_type: "select", placeholder: "", help: "", options: [["standard", "standard"], ["gp2", "gp2"], ["io1", "io1"]], default: "ssd", required: true, load_order: 3, manageiq_key: "storage_type"},
       { id: 10, product_type_id: 4, label: "Storage Redundancy", field_type: "select", placeholder: "", help: "", options: [["normal", "Normal"], ["reduced", "Reduced"]], default: "normal", required: true, load_order: 0, manageiq_key: "availability"},
       { id: 11, product_type_id: 4, label: "Region", field_type: "select", placeholder: "", help: "", options: [["", "US Standard"], ["us-west-1", "US-West (Northern California)"], ["us-west-2", "US-West (Oregon)"], ["EU", "EU (Ireland)"], ["ap-northeast-1", "Asia Pacific (Tokyo)"], ["ap-southeast-1", "Asia Pacific (Singapore)"], ["ap-southeast-2", "Asia Pacific (Sydney)"]], default: "", required: true, load_order: 1, manageiq_key: "region"}
    ])
    ProductTypeQuestion.connection.execute("ALTER SEQUENCE product_type_questions_id_seq RESTART #{ProductTypeQuestion.all.order('id DESC').first.id + 1}")

    Project.create!([
       { id: 1, name: "Project 1", description: "Project description", cc: "--CC--", budget: 123654.0, staff_id: "--STAFF_ID--", start_date: "2015-02-06", end_date: "2015-11-06", img: "images/documentation.png", deleted_at: nil, spent: "0.0", status: 0, approval: 0},
       { id: 2, name: "Mobile App API", description: "Project description", cc: "--CC--", budget: 3000.0, staff_id: "--STAFF_ID--", start_date: "2015-02-06", end_date: "2015-11-06", img: "images/icon-mobile-orange.png", deleted_at: nil, spent: "2000.0", status: 0, approval: 1},
       { id: 3, name: "Blog", description: "Project description", cc: "--CC--", budget: 2000.0, staff_id: "--STAFF_ID--", start_date: "2015-02-06", end_date: "2015-11-06", img: "images/128x128-wordpress.png", deleted_at: nil, spent: "1800.0", status: 0, approval: 1},
       { id: 4, name: "Cloud File Share", description: "Project description", cc: "--CC--", budget: 123654.0, staff_id: "--STAFF_ID--", start_date: "2015-02-06", end_date: "2015-11-06", img: "images//cloud-checkmark-128.png", deleted_at: nil, spent: "0.0", status: 0, approval: 1},
       { id: 5, name: "Cloud Exchange", description: nil, cc: nil, budget: 1000000000.0, staff_id: nil, start_date: "2015-02-12", end_date: "2016-02-11", img: nil, deleted_at: nil, spent: "0.0", status: 0, approval: 0},
       { id: 6, name: "Project Jellyfish Demo", description: nil, cc: nil, budget: 10000.0, staff_id: nil, start_date: "2015-02-13", end_date: "2015-03-13", img: nil, deleted_at: nil, spent: "0.0", status: 0, approval: 0}
    ])
    Project.connection.execute("ALTER SEQUENCE projects_id_seq RESTART #{Project.all.order('id DESC').first.id + 1}")

    ProjectQuestion.create!([
       { id: 1, question: "Project Description", help_text: "", required: true, deleted_at: nil, load_order: nil, options: [], field_type: 2},
       { id: 2, question: "Project Charge Code", help_text: "", required: true, deleted_at: nil, load_order: nil, options: [], field_type: 2},
       { id: 3, question: "Maintenance Day", help_text: "", required: true, deleted_at: nil, load_order: nil, options: [], field_type: 3},
       { id: 4, question: "Performed Maintenance", help_text: "", required: true, deleted_at: nil, load_order: nil, options: [], field_type: 0},
       { id: 5, question: "Default provisioning location", help_text: "", required: true, deleted_at: nil, load_order: nil, options: ["East Coast Data Center", "West Coast Data Center", "Classified Data Center"], field_type: 1},
       { id: 6, question: "Will this run in production?", help_text: "", required: true, deleted_at: nil, load_order: nil, options: ["Yes", "No"], field_type: 1},
       { id: 7, question: "FISMA Classification", help_text: "", required: true, deleted_at: nil, load_order: nil, options: ["Low", "Medium", "High"], field_type: 1},
       { id: 8, question: "Period of Performance", help_text: "in months", required: nil, deleted_at: nil, load_order: 1, field_type: 2}
    ])
    ProjectQuestion.connection.execute("ALTER SEQUENCE project_questions_id_seq RESTART #{ProjectQuestion.all.order('id DESC').first.id + 1}")

    Approval.create!([
       { id: 1, staff_id: 3, project_id: 1, approved: false, reason: nil},
       { id: 2, staff_id: 3, project_id: 2, approved: true, reason: nil}
    ])
    Approval.connection.execute("ALTER SEQUENCE approvals_id_seq RESTART #{Approval.all.order('id DESC').first.id + 1}")

    Order.create!([
       { id: 1, :staff => Staff.where(id: 1).first, engine_response: nil, active: nil, deleted_at: nil, total: 0.0},
       { id: 2, :staff => Staff.where(id: 1).first, engine_response: nil, active: nil, deleted_at: nil, total: 0.0},
       { id: 3, :staff => Staff.where(id: 1).first, engine_response: nil, active: nil, deleted_at: nil, total: 0.0},
       { id: 4, :staff => Staff.where(id: 1).first, engine_response: nil, active: nil, deleted_at: nil, total: 0.0},
       { id: 5, :staff => Staff.where(id: 1).first, engine_response: nil, active: nil, deleted_at: nil, total: 0.0},
       { id: 6, :staff => Staff.where(id: 1).first, engine_response: nil, active: nil, deleted_at: nil, total: 0.0},
       { id: 7, :staff => Staff.where(id: 1).first, engine_response: nil, active: nil, deleted_at: nil, total: 0.0},
       { id: 8, :staff => Staff.where(id: 1).first, engine_response: nil, active: nil, deleted_at: nil, total: 0.0},
       { id: 9, :staff => Staff.where(id: 1).first, engine_response: nil, active: nil, deleted_at: nil, total: 0.0}
    ])
    Order.connection.execute("ALTER SEQUENCE orders_id_seq RESTART #{Order.all.order('id DESC').first.id + 1}")

    OrderItem.create!([
        { id: 9, order_id: 3, cloud_id: 1, :product => Product.where(id: 2).first, service_id: nil, provision_status: 0, deleted_at: nil, :project => Project.where(id: 4).first, miq_id: nil, uuid: "54048bdc-3cab-4e71-85ca-3b50a3879a31", setup_price: "2.99", hourly_price: "0.0025", monthly_price: "0.075", payload_request: nil, payload_acknowledgement: nil, payload_response: nil, latest_alert_id: nil},
        { id: 8, order_id: 2, cloud_id: 1, :product => Product.where(id: 5).first, service_id: nil, provision_status: 2, deleted_at: nil, :project => Project.where(id: 3).first, miq_id: nil, uuid: "4f249639-17ca-493d-8548-9b0728bfc99b", setup_price: "1.99", hourly_price: "0.004", monthly_price: "0.1", payload_request: nil, payload_acknowledgement: nil, payload_response: nil, latest_alert_id: nil},
        { id: 4, order_id: 1, cloud_id: 1, :product => Product.where(id: 10).first, service_id: nil, provision_status: 0, deleted_at: nil, :project => Project.where(id: 2).first, miq_id: nil, uuid: "0c01b271-fcc6-4fdd-9dab-21f3f2f44e59", setup_price: "0.99", hourly_price: "0.01", monthly_price: "0.05", payload_request: nil, payload_acknowledgement: nil, payload_response: nil, latest_alert_id: nil},
        { id: 10, order_id: 3, cloud_id: 1, :product => Product.where(id: 2).first, service_id: nil, provision_status: 0, deleted_at: nil, :project => Project.where(id: 4).first, miq_id: nil, uuid: "e8e488c2-ca19-4d6f-aaf1-42d28050904d", setup_price: "2.99", hourly_price: "0.0025", monthly_price: "0.075", payload_request: nil, payload_acknowledgement: nil, payload_response: nil, latest_alert_id: nil},
        { id: 12, order_id: 3, cloud_id: 1, :product => Product.where(id: 10).first, service_id: nil, provision_status: 0, deleted_at: nil, :project => Project.where(id: 4).first, miq_id: nil, uuid: "ee0164e6-89b7-451f-8351-8fd3d52d4eee", setup_price: "0.99", hourly_price: "0.001", monthly_price: "0.05", payload_request: nil, payload_acknowledgement: nil, payload_response: nil, latest_alert_id: nil},
        { id: 1, order_id: 1, cloud_id: 1, :product => Product.where(id: 1).first, service_id: nil, provision_status: 0, deleted_at: nil, :project => Project.where(id: 2).first, miq_id: nil, uuid: "422d7851-23ad-4525-b4e9-fad1ad0ce797", setup_price: "1.99", hourly_price: "0.05", monthly_price: "0.05", payload_request: nil, payload_acknowledgement: nil, payload_response: nil, latest_alert_id: nil},
        { id: 13, order_id: 3, cloud_id: 1, :product => Product.where(id: 11).first, service_id: nil, provision_status: 0, deleted_at: nil, :project => Project.where(id: 4).first, miq_id: nil, uuid: "4d5fc121-9ff6-4464-9529-d279a6b9ac41", setup_price: "0.99", hourly_price: "0.001", monthly_price: "0.05", payload_request: nil, payload_acknowledgement: nil, payload_response: nil, latest_alert_id: nil},
        { id: 5, order_id: 2, cloud_id: 1, :product => Product.where(id: 2).first, service_id: nil, provision_status: 0, deleted_at: nil, :project => Project.where(id: 3).first, miq_id: nil, uuid: "020d8618-e2b2-4a3f-9390-a086d4fdc84a", setup_price: "2.99", hourly_price: "0.0025", monthly_price: "0.075", payload_request: nil, payload_acknowledgement: nil, payload_response: nil, latest_alert_id: nil},
        { id: 6, order_id: 2, cloud_id: 1, :product => Product.where(id: 2).first, service_id: nil, provision_status: 0, deleted_at: nil, :project => Project.where(id: 3).first, miq_id: nil, uuid: "152a5fb2-708c-412c-9187-3030d07089fd", setup_price: "2.99", hourly_price: "0.0025", monthly_price: "0.075", payload_request: nil, payload_acknowledgement: nil, payload_response: nil, latest_alert_id: nil},
        { id: 11, order_id: 3, cloud_id: 1, :product => Product.where(id: 7).first, service_id: nil, provision_status: 2, deleted_at: nil, :project => Project.where(id: 4).first, miq_id: nil, uuid: "8402db1c-b0ca-43b0-9e65-d442be7683ed", setup_price: "3.99", hourly_price: "0.009", monthly_price: "0.5", payload_request: nil, payload_acknowledgement: nil, payload_response: nil, latest_alert_id: nil},
        { id: 15, order_id: 4, cloud_id: 1, :product => Product.where(id: 4).first, service_id: nil, provision_status: 0, deleted_at: nil, :project => Project.where(id: 3).first, miq_id: nil, uuid: "a9e59602-36bf-430f-be92-14f329a99c4a", setup_price: "1.0", hourly_price: "1.0", monthly_price: "1.0", payload_request: nil, payload_acknowledgement: nil, payload_response: nil, latest_alert_id: nil},
        { id: 2, order_id: 1, cloud_id: 1, :product => Product.where(id: 1).first, service_id: nil, provision_status: 0, deleted_at: nil, :project => Project.where(id: 2).first, miq_id: nil, uuid: "7ee39a34-8fb2-4cf4-979a-9ae4d480b6e6", setup_price: "1.99", hourly_price: "0.05", monthly_price: "0.05", payload_request: nil, payload_acknowledgement: nil, payload_response: nil, latest_alert_id: nil},
        { id: 3, order_id: 1, cloud_id: 1, :product => Product.where(id: 6).first, service_id: nil, provision_status: 1, deleted_at: nil, :project => Project.where(id: 2).first, miq_id: nil, uuid: "69ea7d91-e7bb-4854-9ff2-bcd167fe6a71", setup_price: "2.99", hourly_price: "0.09", monthly_price: "0.25", payload_request: nil, payload_acknowledgement: nil, payload_response: nil, latest_alert_id: nil},
        { id: 17, order_id: 5, cloud_id: 1, :product => Product.where(id: 5).first, service_id: nil, provision_status: nil, deleted_at: nil, :project => Project.where(id: 2).first, miq_id: nil, uuid: "4b0185f0-c309-4a1a-b3be-c9c0438b945d", setup_price: "1.99", hourly_price: "0.004", monthly_price: "0.1", payload_request: nil, payload_acknowledgement: nil, payload_response: nil, latest_alert_id: nil},
        { id: 18, order_id: 6, cloud_id: 1, :product => Product.where(id: 1).first, service_id: nil, provision_status: nil, deleted_at: nil, :project => Project.where(id: 4).first, miq_id: nil, uuid: "5a459228-b301-42e1-a121-e927cfbfca54", setup_price: "1.99", hourly_price: "0.001", monthly_price: "0.05", payload_request: nil, payload_acknowledgement: nil, payload_response: nil, latest_alert_id: nil},
        { id: 19, order_id: 7, cloud_id: 1, :product => Product.where(id: 16).first, service_id: nil, provision_status: nil, deleted_at: nil, :project => Project.where(id: 3).first, miq_id: nil, uuid: "ce160133-9e2c-4766-923c-d237659de8e6", setup_price: "10.0", hourly_price: "10.0", monthly_price: "10.0", payload_request: nil, payload_acknowledgement: nil, payload_response: nil, latest_alert_id: nil},
        { id: 20, order_id: 8, cloud_id: 1, :product => Product.where(id: 18).first, service_id: nil, provision_status: nil, deleted_at: nil, :project => Project.where(id: 3).first, miq_id: nil, uuid: "44642c1d-2fb9-41d8-9acf-d57e87da61fd", setup_price: "10.0", hourly_price: "10.0", monthly_price: "10.0", payload_request: nil, payload_acknowledgement: nil, payload_response: nil, latest_alert_id: nil},
        { id: 21, order_id: 9, cloud_id: 2, :product => Product.where(id: 34).first, service_id: nil, provision_status: nil, deleted_at: nil, :project => Project.where(id: 3).first, miq_id: nil, uuid: "add8e14e-6ac2-4476-a9f5-84c6b351a716", setup_price: "10.0", hourly_price: "10.0", monthly_price: "10.0", payload_request: nil, payload_acknowledgement: nil, payload_response: nil, latest_alert_id: nil},
    ])
    OrderItem.connection.execute("ALTER SEQUENCE order_items_id_seq RESTART #{OrderItem.all.order('id DESC').first.id + 1}")

    Alert.create!([
       { id: 1, project_id: 3, staff_id: 0, status: "CRITICAL", message: "$200 of $2,000 budget remaining. Please increase funding or instance will be retired.", start_date: nil, end_date: nil, order_item_id: 6},
       { id: 2, project_id: 2, staff_id: 0, status: "WARNING", message: "Medium PostgreSQL is approaching capacity. Please increase DB size or add addtional resources to avoid service interruptions.", start_date: nil, end_date: nil, order_item_id: 3}
    ])
    Alert.connection.execute("ALTER SEQUENCE alerts_id_seq RESTART #{Alert.all.order('id DESC').first.id + 1}")

    StaffProject.create!([
       { id: 1, staff_id: 3, project_id: 1},
       { id: 2, staff_id: 3, project_id: 2},
       { id: 4, staff_id: 3, project_id: 5},
       { id: 5, staff_id: 5, project_id: 3},
       { id: 6, staff_id: 2, project_id: 3}
    ])
    StaffProject.connection.execute("ALTER SEQUENCE staff_projects_id_seq RESTART #{StaffProject.all.order('id DESC').first.id + 1}")

    if Setting.find_by(hid: 'manageiq').present?
      # Assume ManageIQ is enabled
      Setting.find_by(hid: 'manageiq').setting_fields.find_by(hid: 'enabled').update_attributes(value: 'true')

      # Find and set the ManageIQ user email and token
      Setting.find_by(hid: 'manageiq').setting_fields.find_by(hid: 'email').update_attributes(value: 'miq@projectjellyfish.org')
      Setting.find_by(hid: 'manageiq').setting_fields.find_by(hid: 'token').update_attributes(value: 'jellyfish-token')
    end
  end

end
