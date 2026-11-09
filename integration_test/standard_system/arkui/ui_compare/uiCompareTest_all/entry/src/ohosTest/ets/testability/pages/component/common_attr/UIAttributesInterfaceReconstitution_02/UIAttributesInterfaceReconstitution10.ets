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
struct UIAttributesInterfaceReconstitution10 {
  // motionBlur 值列表（包含 undefined 与正常值）
  private motionBlurValueList: Array<MotionBlurOptions | undefined> = [
    { radius: 10, anchor: { x: 0.5, y: 0.5 } },
    { radius: 30, anchor: { x: 0.5, y: 0.5 } },
    undefined,
    { radius: 50, anchor: { x: 0.5, y: 0.5 } },
    { radius: 80, anchor: { x: 0.5, y: 0.5 } }
  ];
  @State currentIndex: number = -1;
  @State motionBlurValue: MotionBlurOptions | undefined = undefined;
  @State statusMessage: string = '等待操作';
  @State statusColor: Color = Color.Grey;
  @State currentMode: string = '默认值(undefined)';
  @State isDynamicMode: boolean = false;
  @State rotation: number = 0;

  aboutToAppear(): void {
    console.info('UIAttributesInterfaceReconstitution10: 页面加载');
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
        Text('motionBlur 接口动态赋值测试')
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
          .fontStyle(FontStyle.Italic)
          .fontColor('#182431')

        Text('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0860')
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

            Text('创建motionBlur值列表（包含undefined值与正常值），点击动态赋值，点击change按钮循环切换')
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

            // 值列表展示
            if (this.isDynamicMode) {
              Column({ space: 2 }) {
                Text('值列表顺序:')
                  .fontSize(9)
                  .fontColor('#666666')
                  .width('100%')

                Text('r:10 → r:30 → undefined → r:50 → r:80')
                  .fontSize(9)
                  .fontColor('#007DFF')
                  .fontFamily('Courier')
                  .width('100%')

                Text('当前索引: ' + (this.currentIndex + 1) + ' / ' + this.motionBlurValueList.length)
                  .fontSize(9)
                  .fontColor('#FF6D00')
                  .fontWeight(FontWeight.Bold)
                  .width('100%')
              }
              .width('100%')
              .padding(5)
              .backgroundColor('#FFF3E0')
              .borderRadius(4)
              .border({ width: 1, color: '#FFB74D' })
            }
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

            // 动态赋值按钮
            Button('动态赋值')
              .id('UIAttributesInterfaceReconstitution10_01')
              .fontSize(11)
              .fontWeight(FontWeight.Medium)
              .width('100%')
              .height(36)
              .backgroundColor('#4CAF50')
              .fontColor('#FFFFFF')
              .borderRadius(6)
              .onClick(() => {
                console.info('motionBlur: 点击动态赋值按钮');
                this.isDynamicMode = true;
                this.currentIndex = -1;
                this.statusMessage = '✓ 动态赋值模式已启用';
                this.statusColor = Color.Green;
                console.info('motionBlur: 动态模式已启用，值列表: ' + JSON.stringify(this.motionBlurValueList));
              })

            // change 按钮
            Button('change')
              .id('UIAttributesInterfaceReconstitution10_02')
              .fontSize(11)
              .fontWeight(FontWeight.Medium)
              .width('100%')
              .height(40)
              .backgroundColor(this.isDynamicMode ? '#FF6D00' : '#CCCCCC')
              .fontColor('#FFFFFF')
              .borderRadius(6)
              .enabled(this.isDynamicMode)
              .onClick(() => {
                if (!this.isDynamicMode) {
                  return;
                }

                // 循环切换值
                this.currentIndex = (this.currentIndex + 1) % this.motionBlurValueList.length;
                this.motionBlurValue = this.motionBlurValueList[this.currentIndex];

                // 更新状态显示
                let valueStr = '';
                if (this.motionBlurValue === undefined) {
                  valueStr = 'undefined';
                  this.statusMessage = '✓ 当前值: undefined（无运动模糊）';
                  this.statusColor = Color.Orange;
                } else {
                  let radius = this.motionBlurValue.radius;
                  valueStr = `radius: ${radius}`;
                  this.statusMessage = `✓ 当前值: { radius: ${radius}, anchor: { x: 0.5, y: 0.5 } }`;
                  
                  if (radius <= 10) {
                    this.statusColor = Color.Blue;
                  } else if (radius <= 30) {
                    this.statusColor = Color.Green;
                  } else if (radius <= 50) {
                    this.statusColor = Color.Orange;
                  } else {
                    this.statusColor = Color.Red;
                  }
                }

                this.currentMode = `动态值[${this.currentIndex + 1}]: ${valueStr}`;

                console.info(`motionBlur: change 按钮 - 索引=${this.currentIndex}, 值=${valueStr}`);
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

              Text('2. 点击"动态赋值"按钮，启用动态模式')
                .fontSize(9)
                .fontColor('#666666')
                .width('100%')

              Text('3. 点击"change"按钮，循环切换值列表')
                .fontSize(9)
                .fontColor('#666666')
                .width('100%')

              Text('4. 观察效果展示区的运动模糊效果变化')
                .fontSize(9)
                .fontColor('#666666')
                .width('100%')

              Text('5. 多次点击"change"按钮，验证循环切换')
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
              Text('• 动态赋值启用后，change按钮可用')
                .fontSize(9)
                .fontColor('#4CAF50')
                .width('100%')

              Text('• 点击change按钮，按顺序切换值')
                .fontSize(9)
                .fontColor('#4CAF50')
                .width('100%')

              Text('• r:10 → r:30 → undefined → r:50 → r:80 循环')
                .fontSize(9)
                .fontColor('#4CAF50')
                .width('100%')

              Text('• 模糊半径越大，拖尾模糊越明显')
                .fontSize(9)
                .fontColor('#4CAF50')
                .width('100%')

              Text('• 每次切换效果变化正常、无崩溃')
                .fontSize(9)
                .fontColor('#4CAF50')
                .fontWeight(FontWeight.Bold)
                .width('100%')

              Text('• 索引和当前值正确显示')
                .fontSize(9)
                .fontColor('#4CAF50')
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
