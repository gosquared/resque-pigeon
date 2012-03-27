# Resque::Pigeon

Delivers messages via 3rd party providers which have been previously enqueued in redis as resque jobs.

Currently supports tweets via [twitter](https://github.com/jnunemaker/twitter) gem and e-mails via [postmark](https://github.com/wildbit/postmark-gem) gem.

## Installation

Add this line to your application's Gemfile:

    gem 'resque-pigeon'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install resque-pigeon

## Usage

To start the a worker that will deliver e-mails via Postmark:

    DELIVERY=postmark resque-pigeon

This will only load the code required for delivering e-mails via Postmark. If
you require a different delivery method, you can start it in a different
process:

    DELIVERY=twitter resque-pigeon

Alternatively, you can have a single worker which will handle multiple delivery
methods:

    DELIVERY=postmark,twitter resque-pigeon

### Send tweets

Enqueue message that you want to send:

    Resque.enqueue(
      'Resque::Pigeon::DeliveryMethod::Twitter', {
        "Message to be sent as DM"
      }
    )

If you are using resque-status or any other plugin which requires you to
enqueue resque jobs differently, use those guidelines.

### E-mails via Postmark

Enqueue message that you want to send:

    Resque.enqueue(
      'Resque::Pigeon::DeliveryMethod::Postmark', {
        from: "from@email.com",
        to: "to@emailcom",
        subject: "A very important e-mail",
        message: "A very important message."
      }
    )

All arguments that you pass in will be forwarded to
[Mail](https://github.com/mikel/mail/tree/master/lib/mail/fields).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
