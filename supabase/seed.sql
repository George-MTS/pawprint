-- Sample submissions for local development
INSERT INTO submissions (
  pet_type, pet_name, breed_provided, age, origin, owner_name,
  ai_breed_identified, ai_confidence, ai_temperament, ai_care_notes,
  ai_traits, ai_fun_fact, ai_origin
) VALUES
(
  'dog', 'Max', 'Labrador', '3 years', 'Kenya', 'Alice',
  'Labrador Retriever', 92,
  'Friendly, outgoing, and active',
  'Requires daily exercise and regular grooming. Loves water.',
  '["loyal", "playful", "gentle", "intelligent"]',
  'Labradors were originally bred to retrieve fishing nets in Newfoundland.',
  'Canada'
),
(
  'cat', 'Luna', 'Siamese', '2 years', 'Uganda', 'Bob',
  'Siamese', 88,
  'Vocal, affectionate, and social',
  'Needs mental stimulation and interactive play. Very talkative.',
  '["vocal", "affectionate", "curious", "social"]',
  'Siamese cats were once sacred temple cats in Thailand.',
  'Thailand'
),
(
  'dog', 'Buddy', NULL, '5 years', 'Tanzania', 'Carol',
  'Golden Retriever Mix', 76,
  'Calm, friendly, and patient',
  'Weekly brushing recommended. Great with families.',
  '["friendly", "patient", "loyal", "gentle"]',
  'Golden Retrievers were developed in the Scottish Highlands in the 1800s.',
  'Scotland'
);
