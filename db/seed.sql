-- Esse arquivo popula a tabela "building" com os dados abaixo:
-- Principais faculdades e institutos -- USP Cidade Universitária (Butantã).

INSERT OR IGNORE INTO building (id, name, slug, lon, lat) VALUES
  -- Exatas e Tecnologia
  ('ime', 'Instituto de Matemática e Estatística (IME)', 'ime-usp', -46.731813, -23.559315),
  ('if', 'Instituto de Física (IF)', 'if-usp', -46.732389, -23.561561),
  ('iq', 'Instituto de Química (IQ)', 'iq-usp', -46.729444, -23.564722),
  ('poli', 'Escola Politécnica (EP / Poli)', 'poli-usp', -46.731944, -23.555278),
  ('iag', 'Instituto de Astronomia, Geofísica e Ciências Atmosféricas (IAG)', 'iag-usp', -46.735833, -23.559444),
  ('igc', 'Instituto de Geociências (IGc)', 'igc-usp', -46.733611, -23.560278),
  ('iee', 'Instituto de Energia e Ambiente (IEE)', 'iee-usp', -46.735278, -23.553889),
  ('icb', 'Instituto de Ciências Biomédicas (ICB)', 'icb-usp', -46.737222, -23.566111),

  -- Humanas, Sociais Aplicadas e Artes
  ('fflch', 'Faculdade de Filosofia, Letras e Ciências Humanas (FFLCH)', 'fflch-usp', -46.723419, -23.563121),
  ('feausp', 'Faculdade de Economia, Administração, Contabilidade e Atuária (FEA)', 'fea-usp', -46.728889, -23.558611),
  ('eca', 'Escola de Comunicações e Artes (ECA)', 'eca-usp', -46.727500, -23.560833),
  ('fau', 'Faculdade de Arquitetura e Urbanismo (FAU)', 'fau-usp', -46.730278, -23.560833),
  ('fe', 'Faculdade de Educação (FE)', 'fe-usp', -46.724722, -23.558889),
  ('iea', 'Instituto de Estudos Avançados (IEA)', 'iea-usp', -46.728611, -23.562222),
  ('ieb', 'Instituto de Estudos Brasileiros (IEB)', 'ieb-usp', -46.729167, -23.560278),
  ('iri', 'Instituto de Relações Internacionais (IRI)', 'iri-usp', -46.729722, -23.562500),

  -- Biológicas, Saúde e Agrárias
  ('ib', 'Instituto de Biociências (IB)', 'ib-usp', -46.734167, -23.566389),
  ('fcf', 'Faculdade de Ciências Farmacêuticas (FCF)', 'fcf-usp', -46.736389, -23.565833),
  ('fousp', 'Faculdade de Odontologia (FO)', 'fo-usp', -46.738253, -23.566776),
  ('fmvz', 'Faculdade de Medicina Veterinária e Zootecnia (FMVZ)', 'fmvz-usp', -46.741389, -23.564444),
  ('eefe', 'Escola de Educação Física e Esporte (EEFE)', 'eefe-usp', -46.722500, -23.556667),
  ('ip', 'Instituto de Psicologia (IP)', 'ip-usp', -46.724444, -23.562222),
  ('io', 'Instituto Oceanográfico (IO)', 'io-usp', -46.733889, -23.558611),

  -- Órgãos Centrais & Inovação
  ('reitoria', 'Reitoria da Universidade de São Paulo', 'reitoria-usp', -46.728333, -23.559167),
  ('inova-usp', 'Inova USP', 'inova-usp', -46.734735, -23.560584),
  ('cepeusp', 'Centro de Práticas Esportivas (CEPEUSP)', 'cepeusp', -46.720833, -23.558333),
  ('sas', 'Superintendência de Assistência Social (SAS / CRUSP)', 'crusp-sas', -46.730833, -23.563333);