ActionMailer::Base.delivery_method = :smtp

ActionMailer::Base.smtp_settings = {
    user_name: 'SMTP_Injection',
    password: '243696b6f5f4625a0e81b0b9c743b8decc4d0a52',
    address: 'smtp.sparkpostmail.com',
    port: 587,
    enable_starttls_auto: true,
    format: :html,
    from: 'postmaster@matrifoto.it'
}