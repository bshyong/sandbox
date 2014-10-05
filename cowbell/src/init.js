var cowbell = require('./cowbell'),
	queueName,
	queue;

if (window.GlobalCowbellNamespace && window.GlobalCowbellNamespace.length > 0) {
	queueName = window.GlobalCowbellNamespace.shift();
	queue = window[queueName];
	queue.q = new snowplow.Snowplow(queue.q, queueName);
} else {
	windowAlias._snaq = window._snaq || [];
	windowAlias._snaq = new snowplow.Snowplow(window._snaq, '_snaq');
}