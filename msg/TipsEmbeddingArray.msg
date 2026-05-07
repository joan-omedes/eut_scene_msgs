# Array of TipsEmbedding messages — one per detected entity in a frame.
# Published by tips_visual_embedder on /tips/embeddings.
std_msgs/Header header
# Source camera frame (resized) — carried for downstream heatmap rendering.
# Header stamp matches the array's header stamp.
sensor_msgs/CompressedImage source_image
TipsEmbedding[] embeddings
