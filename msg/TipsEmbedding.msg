# TipsEmbedding — dense TIPS v2 visual embedding for a single detected entity crop.
#
# Produced by tips_visual_embedder for every entity in an EntityArray.
# Downstream nodes (tips_text_matcher, 6D pose, re-ID…) consume this
# without re-running the GPU encoder.

std_msgs/Header header

# ── Source entity -----------------------------------------------------------
string entity_id          # maps back to the hri_msgs/Entity.id this crop came from

# ── Model metadata ----------------------------------------------------------
string tips_model         # "TIPS" or "TIPS_V2"
string variant            # "B" | "L" | "So" | "g"
int32  image_size         # input resolution (e.g. 448)
int32  patch_size         # ViT patch size  (e.g. 14)
int32  embedding_dim      # D: 768 for B, 1024 for L, 1152 for So, 1536 for g

# ── cls_token (global image embedding) -------------------------------------
# Shape: [embedding_dim]
float32[] cls_token

# ── Spatial feature map (dense grid of patch embeddings) -------------------
# Flattened row-major from shape (H_patches, W_patches, embedding_dim)
# where H_patches = W_patches = image_size / patch_size  (e.g. 32 for 448/14).
# Reshape as: spatial_features.reshape(image_size//patch_size,
#                                       image_size//patch_size,
#                                       embedding_dim)
float32[] spatial_features

# ── Bounding box in the original (full-resolution) frame -------------------
# Normalised [0,1]: xcenter, ycenter, width, height
float32 bbox_xcenter
float32 bbox_ycenter
float32 bbox_width
float32 bbox_height
