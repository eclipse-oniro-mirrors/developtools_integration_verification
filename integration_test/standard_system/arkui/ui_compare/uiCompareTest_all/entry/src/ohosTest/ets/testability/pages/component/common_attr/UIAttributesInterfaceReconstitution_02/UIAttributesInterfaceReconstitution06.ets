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
@Component
struct UIAttributesInterfaceReconstitution06 {
  @State clickEffectValue: ClickEffect | null | undefined = undefined;
  @State statusMessage: string = '等待操作';
  @State statusColor: Color = Color.Grey;
  @State currentMode: string = '默认值(undefined)';
  @State currentIndex: number = 0;
  @State clickCount: number = 0;
  clickEffectValues: (ClickEffect | null | undefined)[] = [
    { level: ClickEffectLevel.LIGHT, scale: 0.9 },
    { level: ClickEffectLevel.MIDDLE, scale: 0.95 },
    { level: ClickEffectLevel.HEAVY, scale: 0.95 },
    null,
    undefined,
    { level: ClickEffectLevel.LIGHT, scale: 0.5 }
  ];

  aboutToAppear(): void {
    console.info('UIAttributesInterfaceReconstitution06: 页面加载');
    this.clickEffectValue = this.clickEffectValues[this.currentIndex];
    this.currentMode = `初始值(${this.getValueDescription(this.clickEffectValue)})`;
    this.statusMessage = `✓ 已加载初始值: ${this.getValueDescription(this.clickEffectValue)}`;
    this.statusColor = Color.Blue;
  }

  getValueDescription(value: ClickEffect | null | undefined): string {
    if (value === null) {
      return 'null';
    } else if (value === undefined) {
      return 'undefined';
    } else {
      const levelName = value.level === ClickEffectLevel.LIGHT ? 'LIGHT' :
        value.level === ClickEffectLevel.MIDDLE ? 'MIDDLE' :
          value.level === ClickEffectLevel.HEAVY ? 'HEAVY' : 'unknown';
      return `${levelName}, scale:${value.scale}`;
    }
  }

  build() {
    Column({ space: 6 }) {
      // 标题区域
      Column({ space: 4 }) {
        Text('clickEffect 接口动态赋值测试')
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
          .fontStyle(FontStyle.Italic)
          .fontColor('#182431')

        Text('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0700')
          .fontSize(8)
          .fontColor('#99182431')
          .fontStyle(FontStyle.Italic)
          .fontFamily('Courier')

        Divider()
          .strokeWidth(1)
          .color('#E5E5E5')
      }
      .width('100%')
      .padding(6)
      .backgroundColor('#FAFAFA')
      .shadow({
        radius: 3,
        color: '#00000015',
        offsetX: 0,
        offsetY: 1
      })
      .borderRadius({ bottomLeft: 6, bottomRight: 6 })

      Scroll() {
        Column({ space: 6 }) {
          // 测试说明
          Column({ space: 3 }) {
            Text('✦ 测试场景')
              .fontSize(12)
              .fontWeight(FontWeight.Medium)
              .fontColor('#182431')
              .width('100%')

            Text('测试clickEffect接口动态赋值，验证效果变化正常无崩溃')
              .fontSize(10)
              .fontColor('#666666')
              .width('100%')
              .lineHeight(14)
              .padding(5)
              .backgroundColor('#FFF8E1')
              .borderRadius(4)
              .border({ width: 1, color: '#FFE082' })
          }
          .width('95%')
          .alignItems(HorizontalAlign.Start)

          // 状态显示
          Column({ space: 3 }) {
            Text('✦ 当前状态')
              .fontSize(12)
              .fontWeight(FontWeight.Medium)
              .fontColor('#182431')
              .width('100%')

            Text(this.statusMessage)
              .fontSize(10)
              .fontWeight(FontWeight.Bold)
              .fontColor(this.statusColor)
              .width('100%')
              .padding(5)
              .backgroundColor('#F5F5F5')
              .borderRadius(4)
              .border({ width: 1, color: '#E0E0E0' })

            Row() {
              Text('当前模式: ')
                .fontSize(10)
                .fontColor('#666666')

              Text(this.currentMode)
                .fontSize(11)
                .fontWeight(FontWeight.Bold)
                .fontColor('#007DFF')
            }
            .width('100%')
            .padding(5)
            .backgroundColor('#E3F2FD')
            .borderRadius(4)
            .justifyContent(FlexAlign.Center)

            Row() {
              Text('当前索引: ')
                .fontSize(10)
                .fontColor('#666666')

              Text(`${this.currentIndex + 1} / ${this.clickEffectValues.length}`)
                .fontSize(11)
                .fontWeight(FontWeight.Bold)
                .fontColor('#007DFF')
            }
            .width('100%')
            .padding(5)
            .backgroundColor('#E3F2FD')
            .borderRadius(4)
            .justifyContent(FlexAlign.Center)

            Row() {
              Text('点击次数: ')
                .fontSize(10)
                .fontColor('#666666')

              Text(`${this.clickCount}`)
                .fontSize(11)
                .fontWeight(FontWeight.Bold)
                .fontColor('#FF5722')
            }
            .width('100%')
            .padding(5)
            .backgroundColor('#E3F2FD')
            .borderRadius(4)
            .justifyContent(FlexAlign.Center)
          }
          .width('95%')
          .alignItems(HorizontalAlign.Start)

          // clickEffect 效果展示区
          Column({ space: 3 }) {
            Text('✦ clickEffect 效果展示')
              .fontSize(12)
              .fontWeight(FontWeight.Medium)
              .fontColor('#182431')
              .width('100%')

            Text('点击回弹效果（点击下方按钮观察不同回弹动画）')
              .fontSize(9)
              .fontColor('#666666')
              .width('100%')

            // 渲染效果展示容器
            Column() {
              Text('点击此按钮测试回弹效果')
                .fontSize(12)
                .fontColor('#666666')
                .margin({ bottom: 10 })

              Button('测试按钮')
                .fontSize(16)
                .id('UIAttributesInterfaceReconstitution06')
                .fontWeight(FontWeight.Bold)
                .width('80%')
                .height(50)
                .backgroundColor('#FF6B6B')
                .fontColor('#FFFFFF')
                .borderRadius(25)
                .clickEffect(this.clickEffectValue)
                .onClick(() => {
                  this.clickCount++;
                  console.info(`clickEffect: 按钮被点击，次数 = ${this.clickCount}`);
                })
            }
            .width('100%')
            .height('12.3%')
            .justifyContent(FlexAlign.Center)
            .backgroundColor('#E8F5E9')
            .borderRadius(6)
            .border({ width: 2, color: '#4CAF50', style: BorderStyle.Dashed })
          }
          .width('95%')
          .alignItems(HorizontalAlign.Start)

          // 操作按钮区
          Column({ space: 5 }) {
            Text('✦ 操作按钮')
              .fontSize(12)
              .fontWeight(FontWeight.Medium)
              .fontColor('#182431')
              .width('100%')

            // 动态赋值按钮
            Button('动态赋值')
              .id('UIAttributesInterfaceReconstitution06_01')
              .fontSize(11)
              .fontWeight(FontWeight.Medium)
              .width('100%')
              .height(36)
              .backgroundColor('#4CAF50')
              .fontColor('#FFFFFF')
              .borderRadius(6)
              .onClick(() => {
                console.info('clickEffect: 点击动态赋值按钮');
                this.currentIndex = 0; // 重置索引
                this.clickEffectValue = this.clickEffectValues[this.currentIndex];
                this.currentMode = `动态赋值(${this.getValueDescription(this.clickEffectValue)})`;
                this.statusMessage = '✓ 已进入动态赋值模式';
                this.statusColor = Color.Green;
                console.info(`clickEffect: 当前值 = ${this.getValueDescription(this.clickEffectValue)}`);
              })

            // 切换值按钮
            Button('Change')
              .id('UIAttributesInterfaceReconstitution06_02')
              .fontSize(11)
              .fontWeight(FontWeight.Medium)
              .width('100%')
              .height(36)
              .backgroundColor('#2196F3')
              .fontColor('#FFFFFF')
              .borderRadius(6)
              .enabled(this.currentMode.startsWith('动态赋值')) // 只有在动态赋值模式下才启用
              .onClick(() => {
                console.info('clickEffect: 点击 Change 按钮');
                this.currentIndex = (this.currentIndex + 1) % this.clickEffectValues.length;
                this.clickEffectValue = this.clickEffectValues[this.currentIndex];
                this.currentMode = `动态赋值(${this.getValueDescription(this.clickEffectValue)})`;
                this.statusMessage = `✓ 已切换到值: ${this.getValueDescription(this.clickEffectValue)}`;
                this.statusColor = Color.Blue;
                console.info(`clickEffect: 当前值 = ${this.getValueDescription(this.clickEffectValue)}`);
              })
          }
          .width('95%')
          .alignItems(HorizontalAlign.Start)

          // 操作步骤
          Column({ space: 3 }) {
            Text('✦ 操作步骤')
              .fontSize(12)
              .fontWeight(FontWeight.Medium)
              .fontColor('#182431')
              .width('100%')

            Column({ space: 2 }) {
              Text('1. 点击"动态赋值"按钮，进入动态模式')
                .fontSize(9)
                .fontColor('#666666')
                .width('100%')

              Text('2. 循环点击"Change"按钮，切换 clickEffect 值')
                .fontSize(9)
                .fontColor('#666666')
                .width('100%')

              Text('3. 每次切换后，点击"测试按钮"观察回弹效果')
                .fontSize(9)
                .fontColor('#666666')
                .width('100%')

              Text('4. 观察不同 level 和 scale 的回弹差异')
                .fontSize(9)
                .fontColor('#666666')
                .width('100%')
            }
            .width('100%')
            .padding(5)
            .backgroundColor('#E3F2FD')
            .borderRadius(4)
            .border({ width: 1, color: '#90CAF9' })
          }
          .width('95%')
          .alignItems(HorizontalAlign.Start)

          // 预期结果
          Column({ space: 3 }) {
            Text('✦ 预期结果')
              .fontSize(12)
              .fontWeight(FontWeight.Medium)
              .fontColor('#182431')
              .width('100%')

            Column({ space: 2 }) {
              Text('• 每次点击"Change"，clickEffect 值按列表顺序切换')
                .fontSize(9)
                .fontColor('#4CAF50')
                .width('100%')

              Text('• 测试按钮的回弹效果随值变化而改变')
                .fontSize(9)
                .fontColor('#4CAF50')
                .width('100%')

              Text('• LIGHT/MIDDLE/HEAVY 三种 level 效果可区分')
                .fontSize(9)
                .fontColor('#4CAF50')
                .width('100%')

              Text('• null/undefined 时按钮无回弹或有默认回弹')
                .fontSize(9)
                .fontColor('#4CAF50')
                .width('100%')

              Text('• 所有操作无崩溃，界面正常响应')
                .fontSize(9)
                .fontColor('#4CAF50')
                .fontWeight(FontWeight.Bold)
                .width('100%')
            }
            .width('100%')
            .padding(5)
            .backgroundColor('#E8F5E9')
            .borderRadius(4)
            .border({ width: 1, color: '#A5D6A7' })
          }
          .width('95%')
          .alignItems(HorizontalAlign.Start)

          // 值列表说明
          Column({ space: 3 }) {
            Text('✦ 值列表说明')
              .fontSize(12)
              .fontWeight(FontWeight.Medium)
              .fontColor('#182431')
              .width('100%')

            Column({ space: 2 }) {
              Text('• 值1: LIGHT, scale:0.9')
                .fontSize(9)
                .fontColor('#666666')
                .width('100%')

              Text('• 值2: MIDDLE, scale:0.95')
                .fontSize(9)
                .fontColor('#666666')
                .width('100%')

              Text('• 值3: HEAVY, scale:0.95')
                .fontSize(9)
                .fontColor('#666666')
                .width('100%')

              Text('• 值4: null (取消效果)')
                .fontSize(9)
                .fontColor('#666666')
                .width('100%')

              Text('• 值5: undefined (默认效果)')
                .fontSize(9)
                .fontColor('#666666')
                .width('100%')

              Text('• 值6: LIGHT, scale:0.5 (大幅缩小)')
                .fontSize(9)
                .fontColor('#666666')
                .width('100%')
            }
            .width('100%')
            .padding(5)
            .backgroundColor('#FFF3E0')
            .borderRadius(4)
            .border({ width: 1, color: '#FFB74D' })
          }
          .width('95%')
          .alignItems(HorizontalAlign.Start)
        }
        .width('100%')
        .padding({ left: 6, right: 6, bottom: 8 })
      }
      .layoutWeight(1)
      .scrollBar(BarState.Auto)

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}

