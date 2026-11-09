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
struct UIAttributesInterfaceReconstitution05 {
  @State clickEffectValue: ClickEffect | null | undefined = undefined;
  @State statusMessage: string = '等待操作';
  @State statusColor: Color = Color.Grey;
  @State currentMode: string = '默认值(undefined)';
  @State clickCount: number = 0;

  aboutToAppear(): void {
    console.info('UIAttributesInterfaceReconstitution05: clickEffect 测试页面加载');
  }

  build() {
    Column({ space: 6 }) {
      // 标题区域
      Column({ space: 4 }) {
        Text('clickEffect 接口静态赋值测试')
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
          .fontStyle(FontStyle.Italic)
          .fontColor('#182431')

        Text('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0690')
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

            Text('测试clickEffect接口静态赋值，验证点击回弹效果正常无崩溃')
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

            Text('点击回弹效果（点击下方按钮观察回弹动画）')
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
                .fontWeight(FontWeight.Bold)
                .id('UIAttributesInterfaceReconstitution05')
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

            // 静态赋值按钮
            Button('静态赋值 (LIGHT)')
              .id('UIAttributesInterfaceReconstitution05_01')
              .fontSize(11)
              .fontWeight(FontWeight.Medium)
              .width('100%')
              .height(36)
              .backgroundColor('#FF6B6B')
              .fontColor('#FFFFFF')
              .borderRadius(6)
              .onClick(() => {
                console.info('clickEffect: 点击静态赋值按钮');
                this.clickEffectValue = { level: ClickEffectLevel.LIGHT, scale: 0.9 };
                this.currentMode = '静态赋值(LIGHT, scale:0.9)';
                this.statusMessage = '✓ 已设置 clickEffect = LIGHT';
                this.statusColor = Color.Red;
                console.info(`clickEffect: 当前值 = LIGHT, scale: 0.9`);
              })

            // undefined 按钮
            Button('undefined')
              .id('UIAttributesInterfaceReconstitution05_02')
              .fontSize(11)
              .fontWeight(FontWeight.Medium)
              .width('100%')
              .height(36)
              .backgroundColor('#FFA726')
              .fontColor('#FFFFFF')
              .borderRadius(6)
              .onClick(() => {
                console.info('clickEffect: 点击 undefined 按钮');
                this.clickEffectValue = undefined;
                this.currentMode = 'undefined';
                this.statusMessage = '✓ 已设置为 undefined';
                this.statusColor = Color.Orange;
                console.info(`clickEffect: 当前值 = undefined`);
              })

            // 正常值按钮
            Button('正常值 (MIDDLE)')
              .id('UIAttributesInterfaceReconstitution05_03')
              .fontSize(11)
              .fontWeight(FontWeight.Medium)
              .width('100%')
              .height(36)
              .backgroundColor('#4CAF50')
              .fontColor('#FFFFFF')
              .borderRadius(6)
              .onClick(() => {
                console.info('clickEffect: 点击正常值按钮');
                this.clickEffectValue = { level: ClickEffectLevel.MIDDLE, scale: 0.95 };
                this.currentMode = '正常值(MIDDLE, scale:0.95)';
                this.statusMessage = '✓ 已设置 clickEffect = MIDDLE';
                this.statusColor = Color.Green;
                console.info(`clickEffect: 当前值 = MIDDLE, scale: 0.95`);
              })

            // null 按钮
            Button('null (取消效果)')
              .id('UIAttributesInterfaceReconstitution05_04')
              .fontSize(11)
              .fontWeight(FontWeight.Medium)
              .width('100%')
              .height(36)
              .backgroundColor('#9C27B0')
              .fontColor('#FFFFFF')
              .borderRadius(6)
              .onClick(() => {
                console.info('clickEffect: 点击 null 按钮');
                this.clickEffectValue = null;
                this.currentMode = 'null (取消效果)';
                this.statusMessage = '✓ 已设置为 null';
                this.statusColor = Color.Yellow;
                console.info(`clickEffect: 当前值 = null`);
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
              Text('1. 点击"静态赋值"，设置 clickEffect = LIGHT')
                .fontSize(9)
                .fontColor('#666666')
                .width('100%')

              Text('2. 点击展示区的"测试按钮"，观察轻微回弹效果')
                .fontSize(9)
                .fontColor('#666666')
                .width('100%')

              Text('3. 点击"undefined"，观察默认回弹效果')
                .fontSize(9)
                .fontColor('#666666')
                .width('100%')

              Text('4. 点击"正常值"，设置 clickEffect = MIDDLE')
                .fontSize(9)
                .fontColor('#666666')
                .width('100%')

              Text('5. 点击"测试按钮"，观察中等回弹效果')
                .fontSize(9)
                .fontColor('#666666')
                .width('100%')

              Text('6. 点击"null"，取消回弹效果')
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
              Text('• LIGHT：按钮点击时有轻微缩小回弹效果(scale:0.9)')
                .fontSize(9)
                .fontColor('#4CAF50')
                .width('100%')

              Text('• undefined：按钮有默认回弹效果')
                .fontSize(9)
                .fontColor('#4CAF50')
                .width('100%')

              Text('• MIDDLE：按钮点击时有中等缩小回弹效果(scale:0.95)')
                .fontSize(9)
                .fontColor('#4CAF50')
                .width('100%')

              Text('• null：按钮点击时无回弹效果')
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

