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
export struct Bitmap0060 {
  @Local extractCount: number = 0;

  build() {
    Scroll() {
      Column({ space: 10 }) {
        Text(`测试用例：SUB_ACE_AI_BITMAP_0060`)
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .width('100%')

        Divider()

        Text(`测试名称：页面中有Image加载的位图，频繁进行抠图`)
          .fontSize(13)
          .fontColor(Color.Blue)
          .width('100%')

        Divider()

        Text(`测试步骤：频繁多次进行提取图片`)
          .fontSize(13)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)

        Divider()

        Text(`预期结果：Image图可正常提取`)
          .fontSize(13)
          .fontColor(Color.Green)
          .width('100%')

        Divider()

        Text(`提取次数计数：${this.extractCount}`)
          .fontSize(12)
          .fontColor(Color.Blue)
          .width('100%')

        Button('记录一次提取\n（手动提取后点击）')
          .id('btn')
          .width('90%')
          .margin({ top: 10 })
          .onClick(() => {
            this.extractCount++;
          })

        Button('重置计数')
          .id('btn_reset')
          .width('90%')
          .backgroundColor(Color.Orange)
          .onClick(() => {
            this.extractCount = 0;
          })

        Divider()

        Column({ space: 15 }) {
          Text('测试图片：')
            .fontSize(13)
            .fontWeight(FontWeight.Bold)
            .width('100%')

          // 多张测试图片
          Grid() {
            ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], (index: number) => {
              GridItem() {
                Image($r('app.media.icon'))
                  .width(70)
                  .height(70)
                  .objectFit(ImageFit.Contain)
              }
            })
          }
          .columnsTemplate('1fr 1fr 1fr 1fr')
          .rowsGap(10)
          .columnsGap(10)
          .width('100%')
          .height('16.39%')

          Divider()

          Text('测试说明：')
            .fontSize(13)
            .fontWeight(FontWeight.Bold)
            .width('100%')

          Text('1. 频繁多次（建议10次以上）提取图片')
            .fontSize(11)
            .fontColor(Color.Gray)
            .width('100%')

          Text('2. 每次提取后点击"记录一次提取"按钮')
            .fontSize(11)
            .fontColor(Color.Gray)
            .width('100%')

          Text('3. 验证每次提取都能正常工作')
            .fontSize(11)
            .fontColor(Color.Gray)
            .width('100%')

          Text('4. 确认无崩溃、卡顿等异常')
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

