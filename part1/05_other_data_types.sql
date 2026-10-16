-- DROP TABLE IF EXISTS basics.app_events;
-- CREATE TABLE basics.app_events(
--   id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
--   event_name TEXT NOT NULL,
--   metadata JSONB DEFAULT '{}'::jsonb,
--   created_at TIMESTAMP DEFAULT NOW()
-- );
-- INSERT INTO basics.app_events (event_name, metadata)
-- VALUES(
--   'sign_up',
--   '{"browser": "chrome"}'
-- ),(
--   'sign_in',
--   '{"user": "emma"}'
-- );
-- SELECT * FROM  basics.app_events;
-- SELECT 
--   event_name, 
--   metadata -> 'browser' AS browser 
--   FROM basics.app_events 
--   WHERE metadata ? 'browser';
-- DROP TABLE IF EXISTS basics.app_events;

CREATE TABLE IF NOT EXISTS
  basics.app_events (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    event_name TEXT NOT NULL,
    metadata JSONB DEFAULT '{}'::jsonb,
    created_at TIMESTAMP DEFAULT NOW()
  );

  INSERT INTO basics.app_events(event_name, metadata)
  VALUES(
    'signup',
    '{"browser": "chrome"}'
    ),
    (
      'signin',
      '{"user": "emma"}'
    ),
    ( 
      'device',
      '{
        "brand": "HP",
        "processor": "Core i7",
        "generation": 7,
        "ram_gb": 16,
        "storage_gb": 512,
        "touchscreen": false
      }'
      
    );

SELECT * FROM basics.app_events;

SELECT 
  event_name,
  metadata ->> 'browser' AS browser
FROM basics.app_events
WHERE metadata ? 'browser'