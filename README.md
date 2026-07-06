# eut_scene_msgs

ROS2 interface package for scene understanding pipelines.

Provides message definitions for:
- tool keypoints (tip/handle)
- tool 6D pose outputs
- **TIPS v2 dense visual embeddings** (`TipsEmbedding`, `TipsEmbeddingArray`)
- **TIPS v2 text-guided spatial patch matches** (`TipsPatchMatch`, `TipsPatchMatchArray`)
- **TIPS v2 identity/action messages** that embed full `hri_msgs/Entity`

---

## Message reference

### Entity source
All TIPS-related messages in this package use full `hri_msgs/Entity`.

Upstream repository:
- https://github.com/Eurecat/hri_msgs

### Tool localisation
| Message | Description |
|---|---|
| `ToolKeypoint` | 2D pixel keypoints (tip / trigger optional / handle) for a detected tool |
| `ToolKeypointArray` | Array of `ToolKeypoint` |
| `ToolPose6D` | Full 6D pose estimate for a tool |
| `ToolPose6DArray` | Array of `ToolPose6D` |

`ToolKeypoint` fields:
- `tip_2d`, `trigger_2d`, `handle_2d` are `geometry_msgs/Point` in pixel space.
- `z` is unused and kept at `0.0`.
- Missing optional keypoints are represented with `x = -1.0`, `y = -1.0`.

### TIPS v2 visual embeddings
Produced by the `tips_visual_embedder` ROS 2 package.

| Message | Description |
|---|---|
| `TipsEmbedding` | Per-entity TIPS v2 output: full `hri_msgs/Entity` + `cls_token` (global, shape `[D]`) + `spatial_features` (flattened `H×W×D` grid, default `32×32×768` for variant B) + model metadata |
| `TipsEmbeddingArray` | Array of `TipsEmbedding`, one per detected entity per frame. Published on `/tips/embeddings` |

**Deserialising `spatial_features` in Python:**
```python
import numpy as np
H = W = emb.image_size // emb.patch_size   # e.g. 32
spatial = np.array(emb.spatial_features, dtype=np.float32).reshape(H, W, emb.embedding_dim)
```

### TIPS v2 patch matches
Produced by the `tips_text_matcher` ROS 2 package.

| Message | Description |
|---|---|
| `TipsPatchMatch` | Best spatial patch for a text query: full `hri_msgs/Entity`, `patch_row/col`, `cosine_similarity`, `query` string |
| `TipsPatchMatchArray` | Array of `TipsPatchMatch`, one per entity per frame. Published on `/tips/patch_matches` |
