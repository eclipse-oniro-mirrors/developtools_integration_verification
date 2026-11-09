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
export struct Bitmap0040 {
  @Local isShow: boolean = true;

  build() {
    Scroll() {
      Column({ space: 10 }) {
        Text(`测试用例：SUB_ACE_AI_BITMAP_0040`)
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .width('100%')

        Divider()

        Text(`测试名称：页面中有Image加载的位图(不上树)`)
          .fontSize(13)
          .fontColor(Color.Blue)
          .width('100%')

        Divider()

        Text(`测试步骤：`)
          .fontSize(13)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)

        Text(`1. 双指长按页面唤出小艺，提取图片`)
          .fontSize(12)
          .width('100%')

        Text(`2. 点击Is Show按钮，使png图片下树`)
          .fontSize(12)
          .width('100%')

        Text(`3. 再次提取图片`)
          .fontSize(12)
          .width('100%')

        Divider()

        Text(`预期结果：下树的图片无法提取`)
          .fontSize(13)
          .fontColor(Color.Green)
          .width('100%')

        Divider()

        Button(this.isShow ? 'Is Show: true\n（点击使图片下树）' : 'Is Show: false\n（点击使图片上树）')
          .id('btn')
          .width('90%')
          .backgroundColor(this.isShow ? Color.Green : Color.Red)
          .onClick(() => {
            this.isShow = !this.isShow;
          })

        Divider()

        Column({ space: 15 }) {
          Text(`PNG图片状态：${this.isShow ? '上树（可提取）' : '下树（不可提取）'}`)
            .fontSize(13)
            .fontWeight(FontWeight.Bold)
            .width('100%')
            .fontColor(this.isShow ? Color.Green : Color.Red)

          if (this.isShow) {
            Image($r('app.media.icon'))
              .id('png_img')
              .width(150)
              .height(150)
              .objectFit(ImageFit.Contain)
              .backgroundColor('#F0F0F0')
              .borderRadius(8)
          } else {
            Column() {
              Text('图片已下树')
                .fontSize(16)
                .fontColor(Color.Gray)

              Text('（此时无法被小艺提取）')
                .fontSize(12)
                .fontColor(Color.Red)
                .margin({ top: 5 })
            }
            .width('20.83%')
            .height('12.3%')
            .justifyContent(FlexAlign.Center)
            .backgroundColor('#E0E0E0')
            .borderRadius(8)
          }

          Divider()

          Text('测试说明：')
            .fontSize(13)
            .fontWeight(FontWeight.Bold)
            .width('100%')

          Text('步骤1：图片上树时，提取应该成功')
            .fontSize(11)
            .fontColor(Color.Gray)
            .width('100%')

          Text('步骤2：点击按钮使图片下树')
            .fontSize(11)
            .fontColor(Color.Gray)
            .width('100%')

          Text('步骤3：图片下树后，提取应该失败')
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

