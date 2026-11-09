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

import { Chip, ChipSize } from '@kit.ArkUI';

@Entry
@Component
struct TextChipStyleEnhancement0040 {
  @State fontColorActived: number = 0; // 0: 未激活, 1: 激活
  @State stepStatus: string = '步骤1: 准备点击FontColor actived按钮';

  build() {
    Column() {
      // 标题栏
      Row() {
        Text('激活态文字颜色设置测试')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFFFFF')
      }
      .width('100%')
      .height('4.59%')
      .backgroundColor('#2196F3')
      .justifyContent(FlexAlign.Center)

      Scroll() {
        Column({ space: 20 }) {
          // 当前状态显示
          Column() {
            Text('当前状态')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 10 })
              .alignSelf(ItemAlign.Start)

            Row() {
              Text('FontColor actived: ')
                .fontSize(14)
                .fontColor('#666666')
              Text(`${this.fontColorActived}`)
                .fontSize(14)
                .fontWeight(FontWeight.Bold)
                .fontColor(this.fontColorActived === 1 ? '#4CAF50' : '#FF9800')
            }
            .width('100%')
            .justifyContent(FlexAlign.Start)
            .margin({ bottom: 5 })

            Divider()
              .margin({ top: 10, bottom: 10 })

            Text(this.stepStatus)
              .fontSize(14)
              .fontColor(this.fontColorActived === 1 ? '#4CAF50' : '#2196F3')
              .fontWeight(FontWeight.Medium)
          }
          .width('90%')
          .padding(15)
          .backgroundColor('#F5F5F5')
          .borderRadius(10)
          .margin({ top: 20 })

          // 控制按钮
          Column() {
            Text('测试步骤')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 15 })
              .alignSelf(ItemAlign.Start)

            Button('点击设置 FontColor actived: 1')
              .id('button_set_font_color_actived')
              .fontSize(16)
              .backgroundColor(this.fontColorActived === 1 ? '#4CAF50' : '#2196F3')
              .fontColor('#FFFFFF')
              .width('100%')
              .height(48)
              .onClick(() => {
                this.fontColorActived = 1;
                this.stepStatus = '步骤2: 已设置FontColor actived为1，请查看下方Chip';
                console.info('[TextChipStyleEnhancement0040] FontColor actived设置为1');
              })

            Text('点击按钮后，查看下方第2、3、4个Chip的样式')
              .fontSize(12)
              .fontColor('#999999')
              .margin({ top: 10 })
          }
          .width('90%')
          .padding(15)
          .backgroundColor('#FFFFFF')
          .borderRadius(10)
          .border({ width: 1, color: '#E0E0E0' })

          // Chip展示区域
          Column() {
            Text('Chip展示区域')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 15 })
              .alignSelf(ItemAlign.Start)

            // 第1个Chip - 参考对比
            Column() {
              Text('第1个Chip (参考)')
                .fontSize(12)
                .fontColor('#999999')
                .margin({ bottom: 8 })

              Chip({
                prefixIcon: {
                  src: $r('sys.media.ohos_ic_public_ok'),
                  size: { width: 16, height: 16 },
                  fillColor: '#FF0000' // 红色
                },
                label: {
                  text: 'Chip 1'
                },
                suffixIcon: {
                  src: $r('sys.media.ohos_ic_public_cancel'),
                  size: { width: 16, height: 16 },
                  fillColor: '#FF0000' // 鲜艳的红色
                },
                size: ChipSize.NORMAL,
                allowClose: false,
                backgroundColor: $r('sys.color.ohos_id_color_button_normal')
              })
            }
            .width('100%')
            .alignItems(HorizontalAlign.Start)
            .margin({ bottom: 15 })

            // 第2个Chip - 背景蓝色，字体青色，图标黄色
            Column() {
              Text('第2个Chip')
                .fontSize(12)
                .fontColor('#999999')
                .margin({ bottom: 8 })

              Chip({
                prefixIcon: {
                  src: $r('sys.media.ohos_ic_public_ok'),
                  size: { width: 16, height: 16 },
                  fillColor: '#FFFF00',
                  activatedFillColor: '#FFFF00' // 黄色
                },
                label: {
                  text: 'Chip 2',
                  fontColor: this.fontColorActived === 1 ? '#00FFFF' : Color.Black,
                  activatedFontColor: '#00FFFF' // 激活时的青色
                },
                suffixIcon: {
                  src: $r('sys.media.ohos_ic_public_cancel'),
                  size: { width: 16, height: 16 },
                  fillColor: '#FFFF00',
                  activatedFillColor: '#FFFF00' // 激活时的黄色
                },
                size: ChipSize.NORMAL,
                allowClose: false,
                activated: this.fontColorActived === 1,
                backgroundColor: $r('sys.color.ohos_id_color_button_normal'),
                activatedBackgroundColor: '#0000FF' // 鲜艳的蓝色
              })

              Text('预期: 背景蓝色，字体青色，关闭图标黄色')
                .fontSize(11)
                .fontColor(this.fontColorActived === 1 ? '#4CAF50' : '#FF9800')
                .margin({ top: 5 })
            }
            .width('100%')
            .alignItems(HorizontalAlign.Start)
            .padding(10)
            .backgroundColor(this.fontColorActived === 1 ? '#E8F5E9' : '#FFF3E0')
            .borderRadius(8)
            .margin({ bottom: 15 })

            // 第3个Chip - 背景黄色，字体和图标白色
            Column() {
              Text('第3个Chip')
                .fontSize(12)
                .fontColor('#999999')
                .margin({ bottom: 8 })

              Chip({
                prefixIcon: {
                  src: $r('sys.media.ohos_ic_public_ok'),
                  size: { width: 16, height: 16 },
                  fillColor: '#FFFFFF',
                  activatedFillColor: '#FFFFFF' // 白色
                },
                label: {
                  text: 'Chip 3',
                  fontColor: this.fontColorActived === 1 ? '#FFFFFF' : Color.Black,
                  activatedFontColor: '#FFFFFF' // 激活时的白色
                },
                suffixIcon: {
                  src: $r('sys.media.ohos_ic_public_cancel'),
                  size: { width: 16, height: 16 },
                  fillColor: '#FFFFFF',
                  activatedFillColor: '#FFFFFF' // 激活时的白色
                },
                size: ChipSize.NORMAL,
                allowClose: false,
                activated: this.fontColorActived === 1,
                backgroundColor: $r('sys.color.ohos_id_color_button_normal'),
                activatedBackgroundColor: '#FFD700' // 金黄色（饱和度稍低）
              })

              Text('预期: 背景黄色，字体白色，关闭图标白色')
                .fontSize(11)
                .fontColor(this.fontColorActived === 1 ? '#4CAF50' : '#FF9800')
                .margin({ top: 5 })
            }
            .width('100%')
            .alignItems(HorizontalAlign.Start)
            .padding(10)
            .backgroundColor(this.fontColorActived === 1 ? '#E8F5E9' : '#FFF3E0')
            .borderRadius(8)
            .margin({ bottom: 15 })

            // 第4个Chip - 背景和图标黄色，字体青色
            Column() {
              Text('第4个Chip')
                .fontSize(12)
                .fontColor('#999999')
                .margin({ bottom: 8 })

              Chip({
                prefixIcon: {
                  src: $r('sys.media.ohos_ic_public_ok'),
                  size: { width: 16, height: 16 },
                  fillColor: '#FFFF00',
                  activatedFillColor: '#FFFF00' // 黄色
                },
                label: {
                  text: 'Chip 4',
                  fontColor: this.fontColorActived === 1 ? '#00FFFF' : Color.Black,
                  activatedFontColor: '#00FFFF' // 激活时的青色
                },
                suffixIcon: {
                  src: $r('sys.media.ohos_ic_public_cancel'),
                  size: { width: 16, height: 16 },
                  fillColor: '#FFFF00',
                  activatedFillColor: '#FFFF00' // 激活时的黄色
                },
                size: ChipSize.NORMAL,
                allowClose: false,
                activated: this.fontColorActived === 1,
                backgroundColor: $r('sys.color.ohos_id_color_button_normal'),
                activatedBackgroundColor: '#FFD700' // 金黄色（饱和度稍低）
              })

              Text('预期: 背景黄色，字体青色，关闭图标黄色')
                .fontSize(11)
                .fontColor(this.fontColorActived === 1 ? '#4CAF50' : '#FF9800')
                .margin({ top: 5 })
            }
            .width('100%')
            .alignItems(HorizontalAlign.Start)
            .padding(10)
            .backgroundColor(this.fontColorActived === 1 ? '#E8F5E9' : '#FFF3E0')
            .borderRadius(8)
          }
          .width('90%')
          .padding(15)
          .backgroundColor('#FFFFFF')
          .borderRadius(10)
          .border({ width: 1, color: '#E0E0E0' })

          // 预期结果说明
          Column() {
            Text('预期结果验证')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 15 })
              .alignSelf(ItemAlign.Start)

            Column() {
              Text('第2个Chip预期:')
                .fontSize(14)
                .fontWeight(FontWeight.Medium)
                .fontColor('#333333')
                .alignSelf(ItemAlign.Start)
                .margin({ bottom: 8 })

              Row() {
                Text('•')
                  .fontSize(14)
                  .margin({ right: 8 })
                Text('背景颜色: 蓝色')
                  .fontSize(13)
                  .fontColor('#666666')
                  .layoutWeight(1)
              }
              .width('100%')
              .margin({ bottom: 5 })

              Row() {
                Text('•')
                  .fontSize(14)
                  .margin({ right: 8 })
                Text('字体颜色: 青色 (#00ffff)')
                  .fontSize(13)
                  .fontColor('#666666')
                  .layoutWeight(1)
              }
              .width('100%')
              .margin({ bottom: 5 })

              Row() {
                Text('•')
                  .fontSize(14)
                  .margin({ right: 8 })
                Text('关闭图标: 黄色')
                  .fontSize(13)
                  .fontColor('#666666')
                  .layoutWeight(1)
              }
              .width('100%')
            }
            .width('100%')
            .padding(10)
            .backgroundColor('#E3F2FD')
            .borderRadius(8)
            .margin({ bottom: 15 })

            Column() {
              Text('第3个Chip预期:')
                .fontSize(14)
                .fontWeight(FontWeight.Medium)
                .fontColor('#333333')
                .alignSelf(ItemAlign.Start)
                .margin({ bottom: 8 })

              Row() {
                Text('•')
                  .fontSize(14)
                  .margin({ right: 8 })
                Text('背景颜色: 黄色')
                  .fontSize(13)
                  .fontColor('#666666')
                  .layoutWeight(1)
              }
              .width('100%')
              .margin({ bottom: 5 })

              Row() {
                Text('•')
                  .fontSize(14)
                  .margin({ right: 8 })
                Text('字体颜色: 白色')
                  .fontSize(13)
                  .fontColor('#666666')
                  .layoutWeight(1)
              }
              .width('100%')
              .margin({ bottom: 5 })

              Row() {
                Text('•')
                  .fontSize(14)
                  .margin({ right: 8 })
                Text('关闭图标: 白色')
                  .fontSize(13)
                  .fontColor('#666666')
                  .layoutWeight(1)
              }
              .width('100%')
            }
            .width('100%')
            .padding(10)
            .backgroundColor('#FFF9C4')
            .borderRadius(8)
            .margin({ bottom: 15 })

            Column() {
              Text('第4个Chip预期:')
                .fontSize(14)
                .fontWeight(FontWeight.Medium)
                .fontColor('#333333')
                .alignSelf(ItemAlign.Start)
                .margin({ bottom: 8 })

              Row() {
                Text('•')
                  .fontSize(14)
                  .margin({ right: 8 })
                Text('背景颜色: 黄色')
                  .fontSize(13)
                  .fontColor('#666666')
                  .layoutWeight(1)
              }
              .width('100%')
              .margin({ bottom: 5 })

              Row() {
                Text('•')
                  .fontSize(14)
                  .margin({ right: 8 })
                Text('字体颜色: 青色 (#00ffff)')
                  .fontSize(13)
                  .fontColor('#666666')
                  .layoutWeight(1)
              }
              .width('100%')
              .margin({ bottom: 5 })

              Row() {
                Text('•')
                  .fontSize(14)
                  .margin({ right: 8 })
                Text('关闭图标: 黄色')
                  .fontSize(13)
                  .fontColor('#666666')
                  .layoutWeight(1)
              }
              .width('100%')
            }
            .width('100%')
            .padding(10)
            .backgroundColor('#FFF9C4')
            .borderRadius(8)
          }
          .width('90%')
          .padding(15)
          .backgroundColor('#F5F5F5')
          .borderRadius(10)
          .margin({ bottom: 30 })
        }
        .width('100%')
        .padding({ left: 16, right: 16 })
      }
      .layoutWeight(1)
      .scrollBar(BarState.Auto)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FAFAFA')
  }
}
