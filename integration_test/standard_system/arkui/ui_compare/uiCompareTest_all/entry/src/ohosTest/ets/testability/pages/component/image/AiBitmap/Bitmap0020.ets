/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@ComponentV2
export struct Bitmap0020 {
  build() {
    Scroll() {
      Column({ space: 10 }) {
        Text(`测试用例：SUB_ACE_AI_BITMAP_0020`)
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .width('100%')

        Divider()

        Text(`测试名称：页面中有Image加载的位图及矢量图`)
          .fontSize(13)
          .fontColor(Color.Blue)
          .width('100%')

        Divider()

        Text(`测试步骤：双指长按唤出小艺，提取图片`)
          .fontSize(13)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)

        Divider()

        Text(`预期结果：svg格式矢量图无法提取，其他类型Image可成功提取`)
          .fontSize(13)
          .fontColor(Color.Green)
          .width('100%')

        Divider()

        Column({ space: 15 }) {
          Text('位图和矢量图展示：')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .width('100%')

          // PNG位图
          Row({ space: 10 }) {
            Image($r('app.media.icon'))
              .width(80)
              .height(80)
              .objectFit(ImageFit.Contain)

            Column({ space: 5 }) {
              Text('PNG位图')
                .fontSize(12)
                .fontWeight(FontWeight.Bold)
              Text('✅ 可提取')
                .fontSize(11)
                .fontColor(Color.Green)
            }
            .alignItems(HorizontalAlign.Start)
          }
          .width('100%')
          .padding(10)
          .backgroundColor(Color.White)
          .borderRadius(8)

          // JPG位图
          Row({ space: 10 }) {
            Image($r('app.media.icon'))
              .width(80)
              .height(80)
              .objectFit(ImageFit.Contain)

            Column({ space: 5 }) {
              Text('JPG位图')
                .fontSize(12)
                .fontWeight(FontWeight.Bold)
              Text('✅ 可提取')
                .fontSize(11)
                .fontColor(Color.Green)
            }
            .alignItems(HorizontalAlign.Start)
          }
          .width('100%')
          .padding(10)
          .backgroundColor(Color.White)
          .borderRadius(8)

          // SVG矢量图（使用Path模拟）
          Row({ space: 10 }) {
            Column() {
              Path()
                .width(80)
                .height(80)
                .commands('M0 0 L80 0 L80 80 L0 80 Z M20 20 L60 40 L20 60 Z')
                .fill(Color.Blue)
            }
            .width('11.11%')
            .height('6.56%')
            .backgroundColor('#F0F0F0')
            .justifyContent(FlexAlign.Center)

            Column({ space: 5 }) {
              Text('SVG矢量图')
                .fontSize(12)
                .fontWeight(FontWeight.Bold)
              Text('❌ 无法提取')
                .fontSize(11)
                .fontColor(Color.Red)
            }
            .alignItems(HorizontalAlign.Start)
          }
          .width('100%')
          .padding(10)
          .backgroundColor(Color.White)
          .borderRadius(8)

          Divider()

          Text('测试说明：')
            .fontSize(13)
            .fontWeight(FontWeight.Bold)
            .width('100%')

          Text('1. 双指长按页面唤出小艺')
            .fontSize(11)
            .fontColor(Color.Gray)
            .width('100%')

          Text('2. 点击小艺右下角的提取图片按钮')
            .fontSize(11)
            .fontColor(Color.Gray)
            .width('100%')

          Text('3. 验证PNG/JPG可提取，SVG不可提取')
            .fontSize(11)
            .fontColor(Color.Gray)
            .width('100%')
        }
        .width('100%')
        .padding(20)
        .backgroundColor('#FAFAFA')
        .borderRadius(8)
      }
      .width('100%')
      .padding(20)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}

