std_msgs/Header header
string id
string class_name
# Pixel-space 2D coordinates (x, y). z is unused and kept as 0.0.
# If keypoint is unavailable, publisher sets x=y=-1.0.
geometry_msgs/Point tip_2d
geometry_msgs/Point trigger_2d
geometry_msgs/Point handle_2d
float32 confidence
