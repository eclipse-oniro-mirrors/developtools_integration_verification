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
export struct Bitmap0050 {
  private imageCount: number = 50; // 模拟多图场景

  build() {
    Scroll() {
      Column({ space: 10 }) {
        Text(`测试用例：SUB_ACE_AI_BITMAP_0050`)
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .width('100%')

        Divider()

        Text(`测试名称：页面中有Image加载的位图(图片很多)`)
          .fontSize(13)
          .fontColor(Color.Blue)
          .width('100%')

        Divider()

        Text(`测试步骤：进入multi页面，双指长按唤出小艺，提取图片`)
          .fontSize(13)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)

        Divider()

        Text(`预期结果：Image图可正常提取，当前显示最多提取100张`)
          .fontSize(13)
          .fontColor(Color.Green)
          .width('100%')

        Divider()

        Text(`页面共${this.imageCount}张图片：`)
          .fontSize(13)
          .fontWeight(FontWeight.Bold)
          .width('100%')

        // 生成多个Image组件
        Grid() {
          ForEach(Array.from<number, number>({ length: this.imageCount }, (_, i) => i), (index: number) => {
            GridItem() {
              Column({ space: 5 }) {
                Image($r('app.media.icon'))
                  .width(60)
                  .height(60)
                  .objectFit(ImageFit.Contain)

                Text(`图${index + 1}`)
                  .fontSize(10)
                  .fontColor(Color.Gray)
              }
              .padding(5)
              .backgroundColor(Color.White)
              .borderRadius(4)
            }
          })
        }
        .columnsTemplate('1fr 1fr 1fr 1fr')
        .rowsGap(10)
        .columnsGap(10)
        .width('100%')
        .height('40.98%')

        Divider()

        Text('测试说明：')
          .fontSize(13)
          .fontWeight(FontWeight.Bold)
          .width('100%')

        Text('1. 双指长按唤出小艺')
          .fontSize(11)
          .fontColor(Color.Gray)
          .width('100%')

        Text('2. 点击提取图片按钮')
          .fontSize(11)
          .fontColor(Color.Gray)
          .width('100%')

        Text('3. 验证可以提取图片（最多100张）')
          .fontSize(11)
          .fontColor(Color.Gray)
          .width('100%')

        Text('4. 如果图片超过100张，只显示前100张')
          .fontSize(11)
          .fontColor(Color.Gray)
          .width('100%')
      }
      .width('100%')
      .padding(20)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}

