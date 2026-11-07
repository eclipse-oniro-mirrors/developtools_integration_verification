/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { drawing } from '@kit.ArkGraphics2D';

@Entry
@Component
struct UiComponentTextImagespanColorfilter0020 {
  // 使用 drawing.ColorFilter 类型对象进行颜色滤镜测试
  // 定义颜色滤镜矩阵数组，传入colorFilter时由drawing模块处理
  
  // 红色滤镜矩阵（保留红色通道）
  private redFilterMatrix: number[] = [
    1, 0, 0, 0, 0,  // R保留
    0, 0, 0, 0, 0,  // G置零
    0, 0, 0, 0, 0,  // B置零
    0, 0, 0, 1, 0   // A不变
  ]

  // 蓝色滤镜矩阵（保留蓝色通道）
  private blueFilterMatrix: number[] = [
    0, 0, 0, 0, 0,  // R置零
    0, 0, 0, 0, 0,  // G置零
    0, 0, 1, 0, 0,  // B保留
    0, 0, 0, 1, 0   // A不变
  ]

  // 绿色滤镜矩阵（保留绿色通道）
  private greenFilterMatrix: number[] = [
    0, 0, 0, 0, 0,  // R置零
    0, 1, 0, 0, 0,  // G保留
    0, 0, 0, 0, 0,  // B置零
    0, 0, 0, 1, 0   // A不变
  ]

  // 灰度滤镜矩阵
  private grayFilterMatrix: number[] = [
    0.299, 0.587, 0.114, 0, 0,  // R灰度转换
    0.299, 0.587, 0.114, 0, 0,  // G灰度转换
    0.299, 0.587, 0.114, 0, 0,  // B灰度转换
    0, 0, 0, 1, 0               // A不变
  ]

  // 反色滤镜矩阵
  private invertFilterMatrix: number[] = [
    -1, 0, 0, 0, 1,  // R反转
    0, -1, 0, 0, 1,  // G反转
    0, 0, -1, 0, 1,  // B反转
    0, 0, 0, 1, 0    // A不变
  ]

  build() {
    Column({ space: 20 }) {
      Text('SUB_ACE_UI_COMPONENT_TEXT_IMAGESPAN_COLORFILTER_0020')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('测试DrawingColorFilter - 不同类型图片的颜色滤镜效果')
        .fontSize(14)
        .fontColor('#666666')
        .margin({ bottom: 20 })

      // 红色滤镜 - 所有图片格式
      Text() {
        Span('红色滤镜：\n')
          .fontSize(14)
          .fontColor(Color.Red)
          .fontWeight(FontWeight.Bold)
        ImageSpan($r(`app.media.jpgtest`))
          .width(60)
          .height(60)
          .colorFilter(this.redFilterMatrix)
          .id('imagespan_jpg_red_0020')
        ImageSpan($r(`app.media.pngtest`))
          .width(60)
          .height(60)
          .colorFilter(this.redFilterMatrix)
          .id('imagespan_png_red_0020')
        ImageSpan($r(`app.media.bmptest`))
          .width(60)
          .height(60)
          .colorFilter(this.redFilterMatrix)
          .id('imagespan_bmp_red_0020')
        ImageSpan($r(`app.media.svgtest`))
          .width(60)
          .height(60)
          .colorFilter(this.redFilterMatrix)
          .id('imagespan_svg_red_0020')
        ImageSpan($r(`app.media.giftest`))
          .width(60)
          .height(60)
          .colorFilter(this.redFilterMatrix)
          .id('imagespan_gif_red_0020')
      }
      .width('90%')
      .padding(10)
      .border({ width: 1, color: '#dddddd', radius: 8 })
      .backgroundColor(Color.White)

      // 蓝色滤镜 - 所有图片格式
      Text() {
        Span('蓝色滤镜：\n')
          .fontSize(14)
          .fontColor(Color.Blue)
          .fontWeight(FontWeight.Bold)
        ImageSpan($r(`app.media.jpgtest`))
          .width(60)
          .height(60)
          .colorFilter(this.blueFilterMatrix)
          .id('imagespan_jpg_blue_0020')
        ImageSpan($r(`app.media.pngtest`))
          .width(60)
          .height(60)
          .colorFilter(this.blueFilterMatrix)
          .id('imagespan_png_blue_0020')
        ImageSpan($r(`app.media.bmptest`))
          .width(60)
          .height(60)
          .colorFilter(this.blueFilterMatrix)
          .id('imagespan_bmp_blue_0020')
        ImageSpan($r(`app.media.svgtest`))
          .width(60)
          .height(60)
          .colorFilter(this.blueFilterMatrix)
          .id('imagespan_svg_blue_0020')
        ImageSpan($r(`app.media.giftest`))
          .width(60)
          .height(60)
          .colorFilter(this.blueFilterMatrix)
          .id('imagespan_gif_blue_0020')
      }
      .width('90%')
      .padding(10)
      .border({ width: 1, color: '#dddddd', radius: 8 })
      .backgroundColor(Color.White)

      // 绿色滤镜 - 所有图片格式
      Text() {
        Span('绿色滤镜：\n')
          .fontSize(14)
          .fontColor(Color.Green)
          .fontWeight(FontWeight.Bold)
        ImageSpan($r(`app.media.jpgtest`))
          .width(60)
          .height(60)
          .colorFilter(this.greenFilterMatrix)
          .id('imagespan_jpg_green_0020')
        ImageSpan($r(`app.media.pngtest`))
          .width(60)
          .height(60)
          .colorFilter(this.greenFilterMatrix)
          .id('imagespan_png_green_0020')
        ImageSpan($r(`app.media.bmptest`))
          .width(60)
          .height(60)
          .colorFilter(this.greenFilterMatrix)
          .id('imagespan_bmp_green_0020')
        ImageSpan($r(`app.media.svgtest`))
          .width(60)
          .height(60)
          .colorFilter(this.greenFilterMatrix)
          .id('imagespan_svg_green_0020')
        ImageSpan($r(`app.media.giftest`))
          .width(60)
          .height(60)
          .colorFilter(this.greenFilterMatrix)
          .id('imagespan_gif_green_0020')
      }
      .width('90%')
      .padding(10)
      .border({ width: 1, color: '#dddddd', radius: 8 })
      .backgroundColor(Color.White)

      // 灰度滤镜 - 所有图片格式
      Text() {
        Span('灰度滤镜：\n')
          .fontSize(14)
          .fontColor(Color.Gray)
          .fontWeight(FontWeight.Bold)
        ImageSpan($r(`app.media.jpgtest`))
          .width(60)
          .height(60)
          .colorFilter(this.grayFilterMatrix)
          .id('imagespan_jpg_gray_0020')
        ImageSpan($r(`app.media.pngtest`))
          .width(60)
          .height(60)
          .colorFilter(this.grayFilterMatrix)
          .id('imagespan_png_gray_0020')
        ImageSpan($r(`app.media.bmptest`))
          .width(60)
          .height(60)
          .colorFilter(this.grayFilterMatrix)
          .id('imagespan_bmp_gray_0020')
        ImageSpan($r(`app.media.svgtest`))
          .width(60)
          .height(60)
          .colorFilter(this.grayFilterMatrix)
          .id('imagespan_svg_gray_0020')
        ImageSpan($r(`app.media.giftest`))
          .width(60)
          .height(60)
          .colorFilter(this.grayFilterMatrix)
          .id('imagespan_gif_gray_0020')
      }
      .width('90%')
      .padding(10)
      .border({ width: 1, color: '#dddddd', radius: 8 })
      .backgroundColor(Color.White)

      // 反色滤镜 - 所有图片格式
      Text() {
        Span('反色滤镜：\n')
          .fontSize(14)
          .fontColor('#FF00FF')
          .fontWeight(FontWeight.Bold)
        ImageSpan($r(`app.media.jpgtest`))
          .width(60)
          .height(60)
          .colorFilter(this.invertFilterMatrix)
          .id('imagespan_jpg_invert_0020')
        ImageSpan($r(`app.media.pngtest`))
          .width(60)
          .height(60)
          .colorFilter(this.invertFilterMatrix)
          .id('imagespan_png_invert_0020')
        ImageSpan($r(`app.media.bmptest`))
          .width(60)
          .height(60)
          .colorFilter(this.invertFilterMatrix)
          .id('imagespan_bmp_invert_0020')
        ImageSpan($r(`app.media.svgtest`))
          .width(60)
          .height(60)
          .colorFilter(this.invertFilterMatrix)
          .id('imagespan_svg_invert_0020')
        ImageSpan($r(`app.media.giftest`))
          .width(60)
          .height(60)
          .colorFilter(this.invertFilterMatrix)
          .id('imagespan_gif_invert_0020')
      }
      .width('90%')
      .padding(10)
      .border({ width: 1, color: '#dddddd', radius: 8 })
      .backgroundColor(Color.White)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('#f5f5f5')
    .alignItems(HorizontalAlign.Center)
  }
}

