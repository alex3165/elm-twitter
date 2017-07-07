const Twitter = require('twitter')

const {
  CONSUMER_KEY,
  CONSUMER_SECRET,
  ACCESS_TOKEN_KEY,
  ACCESS_TOKEN_SECRET
} = process.env

if (
  !CONSUMER_KEY ||
  !CONSUMER_SECRET ||
  !ACCESS_TOKEN_KEY ||
  !ACCESS_TOKEN_SECRET
) {
  throw new Error('All environment variables need to be set to establish a connection to twitter!')
}

const tweets = new Twitter({
  consumer_key: CONSUMER_KEY,
  consumer_secret: CONSUMER_SECRET,
  access_token_key: ACCESS_TOKEN_KEY,
  access_token_secret: ACCESS_TOKEN_SECRET
})

const listeners = [];

module.exports = {
  listeners,
  listen: (listener) => {
    if (!listeners.length) {
      tweets.stream('https://userstream.twitter.com/1.1/user.json', stream => {
        stream.on('data', data => {
          listeners.forEach(listener => listener(data))
        })

        stream.on('error', function(error) {
          throw error;
        });
      })
    }

    listeners.push(listener)
  }
};
