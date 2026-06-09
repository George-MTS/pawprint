-- Create public storage bucket for pet photos
INSERT INTO storage.buckets (id, name, public)
VALUES ('pet-photos', 'pet-photos', true)
ON CONFLICT (id) DO NOTHING;

-- Allow anyone to upload (public submissions)
CREATE POLICY "Allow public uploads" ON storage.objects
  FOR INSERT WITH CHECK (bucket_id = 'pet-photos');

-- Allow anyone to read (public images)
CREATE POLICY "Allow public reads" ON storage.objects
  FOR SELECT USING (bucket_id = 'pet-photos');
