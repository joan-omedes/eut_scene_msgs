# Stable physical-object identity assigned by tips_visual_embedder's re-ID database.
# One message per detected entity per frame.
# Published as part of TipsObjectIdentityArray on /tips/object_identities.

std_msgs/Header header

# ── Identity fields ────────────────────────────────────────────────────────────
# Stable "Object_N" ID (empty string "" if min_embeddings_to_assign not yet reached).
string object_id

# YOLO class label (e.g. "drill", "cup").
string category

# Volatile track ID from the YOLO tracker (maps to hri_msgs/Entity.track_id).
string entity_id

# True once the identity has >= min_embeddings_to_assign embeddings.
bool is_confirmed

# True if this identity was created for the first time in this frame.
bool is_new_identity

# ── Embedding statistics ───────────────────────────────────────────────────────
# Total CLS embeddings collected for this Object_N (across all track resets).
int32 n_embeddings

# Cosine similarity that triggered the assignment (1.0 for known tracks,
# 0.0 for brand-new identities, [threshold..1.0) for re-identified ones).
float32 assignment_confidence

# ── Bounding box ───────────────────────────────────────────────────────────────
# Normalised [0, 1] relative to the full-resolution camera frame.
float32 bbox_xcenter
float32 bbox_ycenter
float32 bbox_width
float32 bbox_height
