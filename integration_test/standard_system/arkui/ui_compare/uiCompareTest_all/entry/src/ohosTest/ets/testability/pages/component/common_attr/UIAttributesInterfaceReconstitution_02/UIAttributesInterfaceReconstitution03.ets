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
struct UIAttributesInterfaceReconstitution03 {
  @State pixelStretchValue: PixelStretchEffectOptions | undefined = undefined;
  @State statusMessage: string = '等待操作';
  @State statusColor: Color = Color.Grey;
  @State currentMode: string = '默认值(无效果)';

  aboutToAppear(): void {
    console.info('UIAttributesInterfaceReconstitution03: pixelStretchEffect 测试页面加载');
  }

  build() {
    Column({ space: 6 }) {
      // 标题区域
      Column({ space: 4 }) {
        Text('pixelStretchEffect 接口静态赋值测试')
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
          .fontStyle(FontStyle.Italic)
          .fontColor('#182431')

        Text('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0510')
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

            Text('测试pixelStretchEffect接口静态赋值，验证效果变化正常无崩溃')
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

          // pixelStretchEffect 效果展示区
          Column({ space: 3 }) {
            Text('✦ pixelStretchEffect 效果展示')
              .fontSize(12)
              .fontWeight(FontWeight.Medium)
              .fontColor('#182431')
              .width('100%')

            Text('图像边缘像素扩展效果')
              .fontSize(9)
              .fontColor('#666666')
              .width('100%')

            // 渲染效果展示容器
            Column() {
              Text('测试文本内容')
                .fontSize(14)
                .fontColor(Color.White)
                .fontWeight(FontWeight.Bold)
                .backgroundColor('#FF6B6B')
                .padding(10)
                .border({ width: 2, color: '#4ECDC4' })
                .borderRadius(8)
                .pixelStretchEffect(this.pixelStretchValue)
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
            Button('静态赋值')
              .id('UIAttributesInterfaceReconstitution03_01')
              .fontSize(11)
              .fontWeight(FontWeight.Medium)
              .width('100%')
              .height(36)
              .backgroundColor('#FF6B6B')
              .fontColor('#FFFFFF')
              .borderRadius(6)
              .onClick(() => {
                console.info('pixelStretchEffect: 点击静态赋值按钮');
                this.pixelStretchValue = {
                  top: 15,
                  left: 15,
                  right: 15,
                  bottom: 15
                };
                this.currentMode = '静态赋值(15vp)';
                this.statusMessage = '✓ 已设置静态赋值: top/left/right/bottom = 15';
                this.statusColor = Color.Red;
                console.info(`pixelStretchEffect: 当前值 = ${JSON.stringify(this.pixelStretchValue)}`);
              })

            // undefined 按钮
            Button('undefined')
              .id('UIAttributesInterfaceReconstitution03_02')
              .fontSize(11)
              .fontWeight(FontWeight.Medium)
              .width('100%')
              .height(36)
              .backgroundColor('#FFA726')
              .fontColor('#FFFFFF')
              .borderRadius(6)
              .onClick(() => {
                console.info('pixelStretchEffect: 点击 undefined 按钮');
                this.pixelStretchValue = undefined;
                this.currentMode = 'undefined';
                this.statusMessage = '✓ 已设置为 undefined';
                this.statusColor = Color.Orange;
                console.info(`pixelStretchEffect: 当前值 = undefined`);
              })

            // 正常值按钮
            Button('正常值')
              .id('UIAttributesInterfaceReconstitution03_03')
              .fontSize(11)
              .fontWeight(FontWeight.Medium)
              .width('100%')
              .height(36)
              .backgroundColor('#4CAF50')
              .fontColor('#FFFFFF')
              .borderRadius(6)
              .onClick(() => {
                console.info('pixelStretchEffect: 点击正常值按钮');
                this.pixelStretchValue = {
                  top: 10,
                  left: 10,
                  right: 10,
                  bottom: 10
                };
                this.currentMode = '正常值(10vp)';
                this.statusMessage = '✓ 已设置正常值: top/left/right/bottom = 10';
                this.statusColor = Color.Green;
                console.info(`pixelStretchEffect: 当前值 = ${JSON.stringify(this.pixelStretchValue)}`);
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
              Text('1. 点击"静态赋值"按钮，观察像素扩展效果')
                .fontSize(9)
                .fontColor('#666666')
                .width('100%')

              Text('2. 点击"undefined"按钮，观察效果恢复')
                .fontSize(9)
                .fontColor('#666666')
                .width('100%')

              Text('3. 点击"正常值"按钮，观察正常像素扩展效果')
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
              Text('• 静态赋值：文本四周出现像素扩展效果（15vp）')
                .fontSize(9)
                .fontColor('#4CAF50')
                .width('100%')

              Text('• undefined：像素扩展效果消失，恢复原状')
                .fontSize(9)
                .fontColor('#4CAF50')
                .width('100%')

              Text('• 正常值：文本四周出现像素扩展效果（10vp）')
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

