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
struct UIAttributesInterfaceReconstitution09 {
  @State motionBlurValue: MotionBlurOptions | undefined = undefined;
  @State statusMessage: string = '等待操作';
  @State statusColor: Color = Color.Grey;
  @State currentMode: string = '默认值(undefined)';
  @State rotation: number = 0;

  aboutToAppear(): void {
    console.info('UIAttributesInterfaceReconstitution09: motionBlur 测试页面加载');
    // 启动动画，让组件持续旋转以观察运动模糊效果
    this.startRotation();
  }

  startRotation() {
    setInterval(() => {
      this.rotation = (this.rotation + 5) % 360;
    }, 50);
  }

  build() {
    Column({ space: 6 }) {
      // 标题区域
      Column({ space: 4 }) {
        Text('motionBlur 接口静态赋值测试')
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
          .fontStyle(FontStyle.Italic)
          .fontColor('#182431')

        Text('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0850')
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

            Text('测试motionBlur接口静态赋值，验证运动模糊效果正常无崩溃')
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
          }
          .width('95%')
          .alignItems(HorizontalAlign.Start)

          // motionBlur 效果展示区
          Column({ space: 3 }) {
            Text('✦ motionBlur 效果展示')
              .fontSize(12)
              .fontWeight(FontWeight.Medium)
              .fontColor('#182431')
              .width('100%')

            Text('运动模糊效果（组件持续旋转以便观察）')
              .fontSize(9)
              .fontColor('#666666')
              .width('100%')

            // 渲染效果展示容器
            Column() {
              Image('./icon.png')
                .width(100)
                .height(100)
                .rotate({ angle: this.rotation })
                .motionBlur(this.motionBlurValue)
            }
            .width('100%')
            .height('14.75%')
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
            Button('静态赋值 (radius: 20, anchor: { x: 0.5, y: 0.5 })')
              .id('UIAttributesInterfaceReconstitution09_01')
              .fontSize(10)
              .fontWeight(FontWeight.Medium)
              .width('100%')
              .height(40)
              .backgroundColor('#FF6B6B')
              .fontColor('#FFFFFF')
              .borderRadius(6)
              .onClick(() => {
                console.info('motionBlur: 点击静态赋值按钮');
                this.motionBlurValue = {
                  radius: 20,
                  anchor: { x: 0.5, y: 0.5 }
                };
                this.currentMode = '静态赋值(radius: 20)';
                this.statusMessage = '✓ 已设置 motionBlur = { radius: 20, anchor: { x: 0.5, y: 0.5 } }';
                this.statusColor = Color.Red;
                console.info(`motionBlur: 当前值 = radius: 20`);
              })

            // undefined 按钮
            Button('undefined')
              .id('UIAttributesInterfaceReconstitution09_02')
              .fontSize(11)
              .fontWeight(FontWeight.Medium)
              .width('100%')
              .height(36)
              .backgroundColor('#FFA726')
              .fontColor('#FFFFFF')
              .borderRadius(6)
              .onClick(() => {
                console.info('motionBlur: 点击 undefined 按钮');
                this.motionBlurValue = undefined;
                this.currentMode = 'undefined';
                this.statusMessage = '✓ 已设置为 undefined';
                this.statusColor = Color.Orange;
                console.info(`motionBlur: 当前值 = undefined`);
              })

            // 正常值按钮
            Button('正常值 (radius: 50, anchor: { x: 0.5, y: 0.5 })')
              .id('UIAttributesInterfaceReconstitution09_03')
              .fontSize(10)
              .fontWeight(FontWeight.Medium)
              .width('100%')
              .height(40)
              .backgroundColor('#4CAF50')
              .fontColor('#FFFFFF')
              .borderRadius(6)
              .onClick(() => {
                console.info('motionBlur: 点击正常值按钮');
                this.motionBlurValue = {
                  radius: 50,
                  anchor: { x: 0.5, y: 0.5 }
                };
                this.currentMode = '正常值(radius: 50)';
                this.statusMessage = '✓ 已设置 motionBlur = { radius: 50, anchor: { x: 0.5, y: 0.5 } }';
                this.statusColor = Color.Green;
                console.info(`motionBlur: 当前值 = radius: 50`);
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
              Text('1. 观察图标持续旋转动画')
                .fontSize(9)
                .fontColor('#666666')
                .width('100%')

              Text('2. 点击"静态赋值"，设置 motionBlur radius = 20')
                .fontSize(9)
                .fontColor('#666666')
                .width('100%')

              Text('3. 观察展示区出现轻微运动模糊效果')
                .fontSize(9)
                .fontColor('#666666')
                .width('100%')

              Text('4. 点击"undefined"，恢复无模糊效果')
                .fontSize(9)
                .fontColor('#666666')
                .width('100%')

              Text('5. 点击"正常值"，设置 motionBlur radius = 50')
                .fontSize(9)
                .fontColor('#666666')
                .width('100%')

              Text('6. 观察展示区出现明显运动模糊效果')
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
              Text('• radius: 20：旋转图标出现轻微运动拖尾模糊')
                .fontSize(9)
                .fontColor('#4CAF50')
                .width('100%')

              Text('• undefined：图标旋转清晰，无运动模糊')
                .fontSize(9)
                .fontColor('#4CAF50')
                .width('100%')

              Text('• radius: 50：旋转图标出现明显运动拖尾模糊')
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

