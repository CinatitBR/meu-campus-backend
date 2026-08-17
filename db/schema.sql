PRAGMA foreign_keys = ON;

-- 1. BUILDING
CREATE TABLE IF NOT EXISTS building (
    id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    slug TEXT NOT NULL,
    lon REAL NOT NULL,
    lat REAL NOT NULL,
    created_at TEXT NOT NULL DEFAULT (datetime('now'))
);

-- 3. IMAGE METADATA
CREATE TABLE IF NOT EXISTS image_metadata (
    id TEXT PRIMARY KEY,                       -- UUID or nanoid (e.g. 'img_01j123...')
    storage_key TEXT NOT NULL UNIQUE,               -- Path in the bucket: 'routes/step-101.webp'
    
    -- Geolocation (Nullable as planned)
    lon REAL,                                  -- Longitude (e.g. -46.734735)
    lat REAL,                                  -- Latitude (e.g. -23.560584)
    
    created_at TEXT NOT NULL DEFAULT (datetime('now'))
);

-- 2. VISUAL ROUTE
CREATE TABLE IF NOT EXISTS visual_route (
    id TEXT PRIMARY KEY,
    building_id TEXT NOT NULL,
    title TEXT NOT NULL,
    status TEXT NOT NULL DEFAULT 'published' CHECK (status IN ('hidden', 'published')),
    created_at TEXT NOT NULL DEFAULT (datetime('now')),
    FOREIGN KEY (building_id) REFERENCES building(id) ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_visual_route_building ON visual_route(building_id);
CREATE INDEX IF NOT EXISTS idx_visual_route_status ON visual_route(status);

-- 4. VISUAL ROUTE STEP
CREATE TABLE IF NOT EXISTS visual_route_step (
    id TEXT PRIMARY KEY,
    visual_route_id TEXT NOT NULL,
    step_order INTEGER NOT NULL,
    
    -- Foreign keys pointing to image_metadata
    image_id TEXT NOT NULL,
    
    description TEXT,
    created_at TEXT NOT NULL DEFAULT (datetime('now')),
    
    FOREIGN KEY (visual_route_id) REFERENCES visual_route(id) ON DELETE CASCADE,
    FOREIGN KEY (image_id) REFERENCES image_metadata(id) ON DELETE RESTRICT,
    UNIQUE(visual_route_id, step_order)
);

CREATE INDEX IF NOT EXISTS idx_route_step_order ON visual_route_step(visual_route_id, step_order);

