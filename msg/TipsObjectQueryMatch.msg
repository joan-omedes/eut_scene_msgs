# Per-object match result used in both TipsObjectQuery feedback and result.
# Contains visual cosine similarity (query vs spatial patches) and label cosine
# similarity (query vs TIPS text encoding of the YOLO category label).

# Stable Object_N from identity DB (empty if identity_db disabled).
string  object_id

# Volatile track ID from YOLO tracker.
string  entity_id

# YOLO class label (e.g. "drill", "cup").
string  category

# Cosine similarity: query text embedding vs best spatial patch.
float32 visual_sim

# Cosine similarity: query text embedding vs TIPS encoding of category label.
float32 label_sim

# Bounding box — normalised [0, 1] relative to the original camera frame.
float32 bbox_xcenter
float32 bbox_ycenter
float32 bbox_width
float32 bbox_height
