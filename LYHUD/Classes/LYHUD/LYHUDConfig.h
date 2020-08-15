#ifndef LYHUDConfig_h
#define LYHUDConfig_h

static CGFloat LYHUDMinSpace = 35.0;
static CGFloat LYHUDMaxSpace = 80.0;

static CGFloat LYHUDMinWidth = 90.0;
#define LYHUDMaxWidth [UIScreen mainScreen].bounds.size.width - 120.0

static CGFloat LYHUDRadius = 10.0;

#define LYHUDMaxX(id) CGRectGetMaxX((id).frame)
#define LYHUDMinX(id) CGRectGetMinX((id).frame)

#define LYHUDMidX(id) CGRectGetMidX((id).frame)
#define LYHUDMidY(id) CGRectGetMidY((id).frame)

#define LYHUDMaxY(id) CGRectGetMaxY((id).frame)
#define LYHUDMinY(id) CGRectGetMinY((id).frame)

#define LYHUDWidth(id) CGRectGetWidth((id).frame)
#define LYHUDHeight(id) CGRectGetHeight((id).frame)

#define LYHUDBGWhiteColor [UIColor whiteColor]
#define LYHUDBGColor [UIColor colorWithWhite:0 alpha:0.7]

#endif /* LYHUDConfig_h */
