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
export struct Bitmap0030 {
  @Local gifVisible: boolean = true;
  @Local jpgVisible: boolean = true;

  build() {
    Scroll() {
      Column({ space: 10 }) {
        Text(`测试用例：SUB_ACE_AI_BITMAP_0030`)
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .width('100%')

        Divider()

        Text(`测试名称：页面中有Image加载的位图(隐藏)`)
          .fontSize(13)
          .fontColor(Color.Blue)
          .width('100%')

        Divider()

        Text(`测试步骤：`)
          .fontSize(13)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)

        Text(`1. 双指长按唤出小艺，提取图片`)
          .fontSize(12)
          .width('100%')

        Text(`2. 点击Gif图片使其隐藏，点击jpg图片使其隐藏`)
          .fontSize(12)
          .width('100%')

        Text(`3. 再次提取图片`)
          .fontSize(12)
          .width('100%')

        Divider()

        Text(`预期结果：隐藏的Image无法提取`)
          .fontSize(13)
          .fontColor(Color.Green)
          .width('100%')

        Divider()

        Column({ space: 15 }) {
          // GIF图片（用PNG模拟）
          if (this.gifVisible) {
            Column({ space: 5 }) {
              Image($r('app.media.icon'))
                .id('gif_img')
                .width(120)
                .height(120)
                .objectFit(ImageFit.Contain)

              Text('Gif图片（可见）')
                .fontSize(12)

              Button('点击隐藏Gif图片')
                .id('btn_hide_gif')
                .fontSize(12)
                .onClick(() => {
                  this.gifVisible = false;
                })
            }
            .width('100%')
            .padding(10)
            .backgroundColor(Color.White)
            .borderRadius(8)
          } else {
            Column() {
              Text('Gif图片已隐藏')
                .fontSize(12)
                .fontColor(Color.Gray)

              Button('点击显示Gif图片')
                .id('btn_show_gif')
                .fontSize(12)
                .onClick(() => {
                  this.gifVisible = true;
                })
            }
            .width('100%')
            .padding(10)
            .backgroundColor('#F0F0F0')
            .borderRadius(8)
          }

          // JPG图片
          if (this.jpgVisible) {
            Column({ space: 5 }) {
              Image($r('app.media.icon'))
                .id('jpg_img')
                .width(120)
                .height(120)
                .objectFit(ImageFit.Contain)

              Text('JPG图片（可见）')
                .fontSize(12)

              Button('点击隐藏JPG图片')
                .id('btn_hide_jpg')
                .fontSize(12)
                .onClick(() => {
                  this.jpgVisible = false;
                })
            }
            .width('100%')
            .padding(10)
            .backgroundColor(Color.White)
            .borderRadius(8)
          } else {
            Column() {
              Text('JPG图片已隐藏')
                .fontSize(12)
                .fontColor(Color.Gray)

              Button('点击显示JPG图片')
                .id('btn_show_jpg')
                .fontSize(12)
                .onClick(() => {
                  this.jpgVisible = true;
                })
            }
            .width('100%')
            .padding(10)
            .backgroundColor('#F0F0F0')
            .borderRadius(8)
          }

          Divider()

          Text('测试说明：')
            .fontSize(13)
            .fontWeight(FontWeight.Bold)
            .width('100%')

          Text('步骤1：先提取图片，应该可以提取到2张图片')
            .fontSize(11)
            .fontColor(Color.Gray)
            .width('100%')

          Text('步骤2：点击按钮隐藏两张图片')
            .fontSize(11)
            .fontColor(Color.Gray)
            .width('100%')

          Text('步骤3：再次提取图片，应该无法提取（或提取不到）')
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

