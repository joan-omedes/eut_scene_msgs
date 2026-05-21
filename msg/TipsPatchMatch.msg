# Result of matching a TIPS v2 spatial patch against a text query.
# Published by tips_text_matcher for each entity in a TipsEmbeddingArray frame.
# Uses full hri_msgs/Entity from: https://github.com/Eurecat/hri_msgs

std_msgs/Header header

# Full source entity from TipsEmbedding.entity.
hri_msgs/Entity entity

# The text query used for cosine-similarity matching (from YAML config)
string query

# Location of the best-matching patch in the spatial grid
int32  patch_row        # row index in (H_patches × W_patches) grid
int32  patch_col        # col index

# Cosine similarity score of the winning patch against the text query)
float32 cosine_similarity

# Bounding box of the source entity crop in the original frame.
# Normalised [0, 1] relative to the full-resolution camera frame.
float32 bbox_xcenter
float32 bbox_ycenter
float32 bbox_width
float32 bbox_height
