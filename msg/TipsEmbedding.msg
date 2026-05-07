# Dense TIPS v2 visual embedding for a single detected entity crop.
# Published by tips_visual_embedder for every entity in a synchronized EntityArray frame.

std_msgs/Header header

# Entity identity — maps back to hri_msgs/Entity.id
string entity_id

# ── TIPS model provenance ─────────────────────────────────────────────────────
# Downstream nodes need this to know how to interpret the embedding tensors.
string tips_model       # e.g. "TIPS_V2"  (or "TIPS" for v1)
string variant          # e.g. "B"  → embedding_dim=768;  "L" → 1024
int32  image_size       # pixels fed into ViT, e.g. 448
int32  patch_size       # ViT patch size, e.g. 14  → grid = image_size / patch_size
int32  embedding_dim    # feature vector length D  (768 for B, 1024 for L)

# ── CLS token — global embedding of the crop, shape [embedding_dim] ───────────
float32[] cls_token

# ── Spatial feature map — flattened from (H×W×D) row-major ───────────────────
# H = W = image_size / patch_size  (e.g. 32 for image_size=448, patch_size=14)
# Reshape: np.array(spatial_features).reshape(image_size//patch_size,
#                                              image_size//patch_size,
#                                              embedding_dim)
float32[] spatial_features

# ── YOLO category label ───────────────────────────────────────────────────────
# Class name as produced by the YOLO detector (e.g. "drill", "cup", "").
string category

# ── Source bounding box in the original (full-res) frame ─────────────────────
# Normalised [0, 1] relative to the full-resolution camera frame.
float32 bbox_xcenter
float32 bbox_ycenter
float32 bbox_width
float32 bbox_height
