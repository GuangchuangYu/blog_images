require(ggimage)
require(EBImage)
require(grid)
require(showtext)

gc = rasterGrob(image=readImage('gc.png'))
page <- rasterGrob(image=readImage('biobabble_page.png'))

pg <- ggplot(d=data.frame(x=c(0,10), y=c(0,5)), aes(x, y)) + geom_blank() + coord_fixed()

pg + annotation_custom(raster(p), xmin=5, xmax=10, ymin=1, ymax=5)


pg <- pg+geom_subview(gc, x=2.5, y=2.5, width=5.1, height=5.1) + geom_subview(page, x=7.5, y=2.5, width=4.8, height=4.8)

font.add("heiti", "/Library/Fonts/华文黑体.ttf")
showtext.auto()
pg <- pg+theme_void() + labs(title="长按二维码关注biobabble", subtitle="欢迎分享朋友圈",
                             caption='guangchuangyu@gmail.com') +
    theme(title=element_text(family="heiti", size=20))
ggsave(pg, file="biobabble_banner.png", width=8, height=5)
