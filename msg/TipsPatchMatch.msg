# TipsPatchMatch — result of matching a text query against the spatial feature map
# of a single entity crop.  Published by tips_text_matcher.

std_msgs/Header header

# ── Source entity ------------------------------------------------------------
string entity_id            # maps back to the TipsEmbedding / hri_msgs/Entity

# ── Query -------------------------------------------------------------------
string query                # the text query used (e.g. "mango de taladro")

# ── Best-matching patch ------------------------------------------------------
# Indices into the (H_patches × W_patches) spatial grid.
# Pixel region: [patch_row*patch_size : (patch_row+1)*patch_size,
#                patch_col*patch_size : (patch_col+1)*patch_size]
int32 patch_row
int32 patch_col

# Cosine similarity score for the best patch (0.0 – 1.0).
float32 cosine_similarity

# ── Source bounding box (same as in TipsEmbedding) -------------------------
float32 bbox_xcenter
float32 bbox_ycenter
float32 bbox_width
float32 bbox_height
