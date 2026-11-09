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

import { Chip, SymbolGlyphModifier, ChipSize } from '@kit.ArkUI';

@Entry
@Component
struct TextChipSymbol0020 {
  @State currentFontColor: ResourceColor[] = [Color.Blue];
  @State fontColorIndex: number = 0;
  @State isActivated: boolean = false;
  @State currentFontColorDesc: string = 'Color.Blue';
  
  // fontColor测试值数组
  private fontColorValues: Array<ResourceColor[]> = [
    [Color.Blue],
    ['#fc0303'],
    [0xFF0000],
    ['rgb(2, 184, 17)'],
    [$r('app.color.Pink')],
    [Color.Black],  // undefined的默认颜色
    [Color.Black],  // null的默认颜色
    [Color.Black]   // 'abcd'的默认颜色
  ];
  
  // fontColor描述数组
  private fontColorDescriptions: string[] = [
    'Color.Blue',
    '#fc0303',
    '0xFF0000',
    'rgb(2, 184, 17)',
    "$r('app.color.Pink')",
    'undefined',
    'null',
    "'abcd'"
  ];

  build() {
    Column() {
      // 标题栏
      Row() {
        Text('基础属性测试')
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
          // 测试说明
          Column() {
            Text('测试说明')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 10 })
              .alignSelf(ItemAlign.Start)

            Text('本测试用例验证Chip组件的prefixSymbol和suffixSymbol的fontSize、fontColor属性')
              .fontSize(12)
              .fontColor('#666666')
              .margin({ bottom: 10 })

            Column() {
              Text('预置条件:')
                .fontSize(13)
                .fontWeight(FontWeight.Medium)
                .fontColor('#333333')
                .alignSelf(ItemAlign.Start)
                .margin({ bottom: 5 })

              Text('1. 创建chip组件')
                .fontSize(12)
                .fontColor('#666666')
                .alignSelf(ItemAlign.Start)
                .margin({ left: 10, bottom: 3 })

              Text('2. 设置prefixSymbol和suffixSymbol属性（normal、activated）')
                .fontSize(12)
                .fontColor('#666666')
                .alignSelf(ItemAlign.Start)
                .margin({ left: 10, bottom: 3 })

              Text('3. 设置fontSize、fontColor属性，fontColor([xx])')
                .fontSize(12)
                .fontColor('#666666')
                .alignSelf(ItemAlign.Start)
                .margin({ left: 10, bottom: 3 })

              Text('4. 传入symbol图标为normal：sys.symbol.ohos_folder_badge_plus；activated：sys.symbol.ohos_trash')
                .fontSize(12)
                .fontColor('#666666')
                .alignSelf(ItemAlign.Start)
                .margin({ left: 10 })
            }
            .width('100%')
            .padding(10)
            .backgroundColor('#FFF3E0')
            .borderRadius(8)
            .margin({ bottom: 10 })

            Column() {
              Text('测试步骤:')
                .fontSize(13)
                .fontWeight(FontWeight.Medium)
                .fontColor('#333333')
                .alignSelf(ItemAlign.Start)
                .margin({ bottom: 5 })

              Text('1. 打开demo应用，进入"基础属性测试"页面')
                .fontSize(12)
                .fontColor('#666666')
                .alignSelf(ItemAlign.Start)
                .margin({ left: 10, bottom: 3 })

              Text('2. 观察"fontSize、fontColor、fontWeight属性"下内容')
                .fontSize(12)
                .fontColor('#666666')
                .alignSelf(ItemAlign.Start)
                .margin({ left: 10, bottom: 3 })

              Text('3. 点击【fontColor】动态按钮切换')
                .fontSize(12)
                .fontColor('#666666')
                .alignSelf(ItemAlign.Start)
                .margin({ left: 10, bottom: 3 })

              Text('4. 点击"改变激活状态"')
                .fontSize(12)
                .fontColor('#666666')
                .alignSelf(ItemAlign.Start)
                .margin({ left: 10 })
            }
            .width('100%')
            .padding(10)
            .backgroundColor('#E3F2FD')
            .borderRadius(8)
            .margin({ bottom: 10 })

            Column() {
              Text('预期结果:')
                .fontSize(13)
                .fontWeight(FontWeight.Medium)
                .fontColor('#333333')
                .alignSelf(ItemAlign.Start)
                .margin({ bottom: 5 })

              Text('normal状态文件夹图标和activated状态垃圾桶图标组件颜色依次为：')
                .fontSize(12)
                .fontColor('#4CAF50')
                .alignSelf(ItemAlign.Start)
                .margin({ left: 10, bottom: 3 })

              Text('蓝色 → 红色 → 红色 → 绿色 → 粉色 → 默认颜色 → 默认颜色 → 默认颜色')
                .fontSize(12)
                .fontColor('#4CAF50')
                .fontWeight(FontWeight.Medium)
                .alignSelf(ItemAlign.Start)
                .margin({ left: 10 })
            }
            .width('100%')
            .padding(10)
            .backgroundColor('#E8F5E9')
            .borderRadius(8)
          }
          .width('90%')
          .padding(15)
          .backgroundColor('#FFFFFF')
          .borderRadius(12)
          .shadow({ radius: 8, color: '#1F000000', offsetX: 0, offsetY: 2 })

          // 当前状态显示
          Column() {
            Text('当前状态')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 10 })
              .alignSelf(ItemAlign.Start)

            Row() {
              Text('激活状态: ')
                .fontSize(14)
                .fontColor('#666666')
              Text(this.isActivated ? 'Activated' : 'Normal')
                .fontSize(14)
                .fontWeight(FontWeight.Bold)
                .fontColor(this.isActivated ? '#4CAF50' : '#2196F3')
            }
            .width('100%')
            .margin({ bottom: 8 })

            Row() {
              Text('当前fontColor: ')
                .fontSize(14)
                .fontColor('#666666')
              Text(this.currentFontColorDesc)
                .fontSize(14)
                .fontWeight(FontWeight.Bold)
                .fontColor('#FF9800')
            }
            .width('100%')
          }
          .width('90%')
          .padding(15)
          .backgroundColor('#FFFFFF')
          .borderRadius(12)
          .shadow({ radius: 8, color: '#1F000000', offsetX: 0, offsetY: 2 })

          // fontSize、fontColor、fontWeight属性测试区域
          Column() {
            Text('fontSize、fontColor、fontWeight属性')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 15 })
              .alignSelf(ItemAlign.Start)

            // Chip组件展示
            Column() {
              Chip({
                prefixSymbol: {
                  normal: new SymbolGlyphModifier($r('sys.symbol.ohos_folder_badge_plus'))
                    .fontSize(30)
                    .fontColor(this.currentFontColor),
                  activated: new SymbolGlyphModifier($r('sys.symbol.ohos_trash'))
                    .fontSize(30)
                    .fontColor(this.currentFontColor)
                },
                suffixSymbol: {
                  normal: new SymbolGlyphModifier($r('sys.symbol.ohos_folder_badge_plus'))
                    .fontSize(30)
                    .fontColor(this.currentFontColor),
                  activated: new SymbolGlyphModifier($r('sys.symbol.ohos_trash'))
                    .fontSize(30)
                    .fontColor(this.currentFontColor)
                },
                label: {
                  text: 'Chip组件测试'
                },
                size: ChipSize.NORMAL,
                activated: this.isActivated
              })
            }
            .width('100%')
            .padding(20)
            .backgroundColor('#F5F5F5')
            .borderRadius(8)
            .justifyContent(FlexAlign.Center)
            .margin({ bottom: 15 })

            // 控制按钮
            Column({ space: 10 }) {
              Button('【fontColor】动态按钮切换')
                .id('fontColorButton')
                .fontSize(16)
                .backgroundColor('#2196F3')
                .fontColor('#FFFFFF')
                .width('100%')
                .height(48)
                .onClick(() => {
                  this.fontColorIndex = (this.fontColorIndex + 1) % this.fontColorValues.length;
                  this.currentFontColor = this.fontColorValues[this.fontColorIndex];
                  this.currentFontColorDesc = this.fontColorDescriptions[this.fontColorIndex];
                  console.info(`[TextChipSymbol0020] fontColor切换为: ${this.currentFontColorDesc}`);
                })

              Button('改变激活状态')
                .id('changeStateButton')
                .fontSize(16)
                .backgroundColor('#4CAF50')
                .fontColor('#FFFFFF')
                .width('100%')
                .height(48)
                .onClick(() => {
                  this.isActivated = !this.isActivated;
                  console.info(`[TextChipSymbol0020] 激活状态切换为: ${this.isActivated ? 'Activated' : 'Normal'}`);
                })

              Button('重置测试')
                .fontSize(16)
                .backgroundColor('#FF9800')
                .fontColor('#FFFFFF')
                .width('100%')
                .height(48)
                .onClick(() => {
                  this.fontColorIndex = 0;
                  this.currentFontColor = this.fontColorValues[0];
                  this.currentFontColorDesc = this.fontColorDescriptions[0];
                  this.isActivated = false;
                  console.info('[TextChipSymbol0020] 测试已重置');
                })
            }
            .width('100%')
          }
          .width('90%')
          .padding(15)
          .backgroundColor('#FFFFFF')
          .borderRadius(12)
          .shadow({ radius: 8, color: '#1F000000', offsetX: 0, offsetY: 2 })

          // 测试提示
          Column() {
            Text('💡 测试提示')
              .fontSize(13)
              .fontWeight(FontWeight.Bold)
              .fontColor('#FF9800')
              .margin({ bottom: 8 })

            Text('• 点击【fontColor】按钮依次切换fontColor值')
              .fontSize(11)
              .fontColor('#666666')
              .alignSelf(ItemAlign.Start)
              .margin({ bottom: 3 })

            Text('• 观察prefixSymbol和suffixSymbol图标颜色变化')
              .fontSize(11)
              .fontColor('#666666')
              .alignSelf(ItemAlign.Start)
              .margin({ bottom: 3 })

            Text('• 点击"改变激活状态"切换normal和activated状态')
              .fontSize(11)
              .fontColor('#666666')
              .alignSelf(ItemAlign.Start)
              .margin({ bottom: 3 })

            Text('• normal状态显示文件夹图标')
              .fontSize(11)
              .fontColor('#666666')
              .alignSelf(ItemAlign.Start)
              .margin({ bottom: 3 })

            Text('• activated状态显示垃圾桶图标')
              .fontSize(11)
              .fontColor('#666666')
              .alignSelf(ItemAlign.Start)
          }
          .width('90%')
          .padding(12)
          .backgroundColor('#FFF8E1')
          .borderRadius(8)
          .margin({ top: 15, bottom: 30 })
        }
        .width('100%')
        .padding({ top: 20, bottom: 20 })
      }
      .layoutWeight(1)
      .scrollBar(BarState.Auto)
      .edgeEffect(EdgeEffect.Spring)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}

