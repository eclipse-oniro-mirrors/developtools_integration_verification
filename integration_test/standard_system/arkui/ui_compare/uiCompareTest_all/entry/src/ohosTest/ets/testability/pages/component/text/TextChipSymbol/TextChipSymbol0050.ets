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
struct TextChipSymbol0050 {
  @State currentSymbolIndex: number = 0;
  @State isActivated: boolean = false;
  @State currentSymbolDesc: string = 'folder_badge_plus';
  
  // symbol图标资源数组
  private symbolResources: Resource[] = [
    $r('sys.symbol.ohos_folder_badge_plus'),
    $r('sys.symbol.trash_circle'),
    $r('sys.symbol.ohos_trash'),
    $r('sys.symbol.picture'),
    $r('sys.symbol.ohos_lungs')
  ];
  
  // symbol图标描述数组
  private symbolDescriptions: string[] = [
    'folder_badge_plus',
    'trash_circle',
    'ohos_trash',
    'picture',
    'ohos_lungs'
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

            Text('本测试用例验证Chip组件的prefixSymbol和suffixSymbol的图标切换功能')
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

              Text('4. 传入symbol图标为normal和activated：')
                .fontSize(12)
                .fontColor('#666666')
                .alignSelf(ItemAlign.Start)
                .margin({ left: 10, bottom: 3 })

              Text('sys.symbol.ohos_folder_badge_plus、sys.symbol.trash_circle、')
                .fontSize(11)
                .fontColor('#666666')
                .alignSelf(ItemAlign.Start)
                .margin({ left: 20, bottom: 2 })

              Text('sys.symbol.ohos_trash、sys.symbol.picture、sys.symbol.ohos_lungs')
                .fontSize(11)
                .fontColor('#666666')
                .alignSelf(ItemAlign.Start)
                .margin({ left: 20 })
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

              Text('2. 观察"切换图标"下内容')
                .fontSize(12)
                .fontColor('#666666')
                .alignSelf(ItemAlign.Start)
                .margin({ left: 10, bottom: 3 })

              Text('3. 点击【切换图标】动态按钮切换')
                .fontSize(12)
                .fontColor('#666666')
                .alignSelf(ItemAlign.Start)
                .margin({ left: 10, bottom: 3 })

              Text('4. 点击"改变激活状态"')
                .fontSize(12)
                .fontColor('#666666')
                .alignSelf(ItemAlign.Start)
                .margin({ left: 10, bottom: 3 })

              Text('5. 点击【切换图标】动态按钮切换')
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

              Text('3. normal状态图标依次为：')
                .fontSize(12)
                .fontColor('#4CAF50')
                .alignSelf(ItemAlign.Start)
                .margin({ left: 10, bottom: 3 })

              Text('folder_badge_plus → trash_circle → ohos_trash → picture → ohos_lungs')
                .fontSize(12)
                .fontColor('#4CAF50')
                .fontWeight(FontWeight.Medium)
                .alignSelf(ItemAlign.Start)
                .margin({ left: 10, bottom: 3 })

              Text('5. activated状态图标依次为：')
                .fontSize(12)
                .fontColor('#4CAF50')
                .alignSelf(ItemAlign.Start)
                .margin({ left: 10, bottom: 3 })

              Text('folder_badge_plus → trash_circle → ohos_trash → picture → ohos_lungs')
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
              Text('当前图标: ')
                .fontSize(14)
                .fontColor('#666666')
              Text(this.currentSymbolDesc)
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

          // 切换图标测试区域
          Column() {
            Text('切换图标')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 15 })
              .alignSelf(ItemAlign.Start)

            // Chip组件展示
            Column() {
              Chip({
                prefixSymbol: {
                  normal: new SymbolGlyphModifier(this.symbolResources[this.currentSymbolIndex])
                    .fontSize(30)
                    .fontColor([Color.Blue]),
                  activated: new SymbolGlyphModifier(this.symbolResources[this.currentSymbolIndex])
                    .fontSize(30)
                    .fontColor([Color.Green])
                },
                suffixSymbol: {
                  normal: new SymbolGlyphModifier(this.symbolResources[this.currentSymbolIndex])
                    .fontSize(30)
                    .fontColor([Color.Blue]),
                  activated: new SymbolGlyphModifier(this.symbolResources[this.currentSymbolIndex])
                    .fontSize(30)
                    .fontColor([Color.Green])
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
              Button('【切换图标】动态按钮切换')
                .id('switchSymbolButton')
                .fontSize(16)
                .backgroundColor('#2196F3')
                .fontColor('#FFFFFF')
                .width('100%')
                .height(48)
                .onClick(() => {
                  this.currentSymbolIndex = (this.currentSymbolIndex + 1) % this.symbolResources.length;
                  this.currentSymbolDesc = this.symbolDescriptions[this.currentSymbolIndex];
                  console.info(`[TextChipSymbol0050] 图标切换为: ${this.currentSymbolDesc}`);
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
                  console.info(`[TextChipSymbol0050] 激活状态切换为: ${this.isActivated ? 'Activated' : 'Normal'}`);
                })

              Button('重置测试')
                .fontSize(16)
                .backgroundColor('#FF9800')
                .fontColor('#FFFFFF')
                .width('100%')
                .height(48)
                .onClick(() => {
                  this.currentSymbolIndex = 0;
                  this.currentSymbolDesc = this.symbolDescriptions[0];
                  this.isActivated = false;
                  console.info('[TextChipSymbol0050] 测试已重置');
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

            Text('• 点击【切换图标】按钮依次切换symbol图标')
              .fontSize(11)
              .fontColor('#666666')
              .alignSelf(ItemAlign.Start)
              .margin({ bottom: 3 })

            Text('• 观察prefixSymbol和suffixSymbol图标变化')
              .fontSize(11)
              .fontColor('#666666')
              .alignSelf(ItemAlign.Start)
              .margin({ bottom: 3 })

            Text('• 点击"改变激活状态"切换normal和activated状态')
              .fontSize(11)
              .fontColor('#666666')
              .alignSelf(ItemAlign.Start)
              .margin({ bottom: 3 })

            Text('• normal状态图标为蓝色')
              .fontSize(11)
              .fontColor('#666666')
              .alignSelf(ItemAlign.Start)
              .margin({ bottom: 3 })

            Text('• activated状态图标为绿色')
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

