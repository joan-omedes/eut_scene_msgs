# Array of TipsObjectIdentity messages — one per detected entity in a frame.
# Published by tips_visual_embedder on /tips/object_identities
# (only when enable_identity_db: true).
std_msgs/Header header
# Source camera frame (same as TipsEmbeddingArray.source_image for the same frame).
sensor_msgs/CompressedImage source_image
TipsObjectIdentity[] identities
