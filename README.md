# Topic: Introduction to n8n and Azure OpenAI service

# Event: styava.dev

## Instructions

- Folk this Github repo
- Run it on your GitHub codespace

## AI Agent
Options > System Message 

```sh
You are a helpful assistant that helps the user answer questions about their calendar

Today is {{ $now.format('cccc') }} the {{  $now.format('yyyy-MM-dd HH:mm') }}.
```

## Google Calendar API
- Operation > Get Many
- Return All > true
- Expand Events > true

```javascript
// Options > After
{ { $fromAI('after', 'The earliest datetime we want to look for events for') }}
```

```javascript
// Options Before
{{ $fromAI('before', 'The latest datetime we want to look for events for')}}
```

```javascript
// Options Query
{{ $fromAI('query', 'The search query to look for in the calendar. Leave empty if no search query is needed') }}
```