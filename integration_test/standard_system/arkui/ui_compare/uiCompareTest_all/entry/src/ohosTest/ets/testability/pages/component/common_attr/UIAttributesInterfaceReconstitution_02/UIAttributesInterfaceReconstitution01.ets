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
struct UIAttributesInterfaceReconstitution01 {
  @State renderGroupValue: boolean | undefined = false;
  @State statusMessage: string = '等待操作';
  @State statusColor: Color = Color.Grey;
  @State currentMode: string = '默认值(false)';

  aboutToAppear(): void {
    console.info('Index: 页面加载');
  }

  build() {
    Column({ space: 6 }) {
      // 标题区域
      Column({ space: 4 }) {
        Text('renderGroup 接口静态赋值测试')
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
          .fontStyle(FontStyle.Italic)
          .fontColor('#182431')

        Text('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0410')
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
      .shadow(
        {
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

            Text('测试renderGroup接口静态赋值、undefined、正常值，验证效果正常无崩溃')
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

          // renderGroup 效果展示区
          Column({ space: 3 }) {
            Text('✦ renderGroup 效果展示')
              .fontSize(12)
              .fontWeight(FontWeight.Medium)
              .fontColor('#182431')
              .width('100%')

            Text('离屏渲染 vs 非离屏渲染')
              .fontSize(9)
              .fontColor('#666666')
              .width('100%')

            // 渲染效果展示容器
            Row() {
              Row() {
                Row()
                  .backgroundColor(Color.Black)
                  .width('11.11%')
                  .height('6.56%')
                  .opacity(1)
              }
              .backgroundColor(Color.White)
              .width('16.67%')
              .height('9.84%')
              .justifyContent(FlexAlign.Center)
              .opacity(0.6)
              .renderGroup(this.renderGroupValue)
            }
            .backgroundColor(Color.Black)
            .width('100%')
            .height('12.3%')
            .justifyContent(FlexAlign.Center)
            .opacity(1)
            .borderRadius(6)
            .border({ width: 2, color: '#007DFF', style: BorderStyle.Solid })
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
            Button('静态赋值 (true)')
              .id('UIAttributesInterfaceReconstitution01_01')
              .fontSize(11)
              .fontWeight(FontWeight.Medium)
              .width('100%')
              .height(36)
              .backgroundColor('#4CAF50')
              .fontColor('#FFFFFF')
              .borderRadius(6)
              .onClick(() => {
                console.info('renderGroup: 点击静态赋值按钮');
                this.renderGroupValue = true;
                this.currentMode = '静态赋值(true)';
                this.statusMessage = '✓ 已设置为 true（离屏渲染）';
                this.statusColor = Color.Green;
                console.info('renderGroup: 当前值 = true');
              })

            // undefined 按钮
            Button('undefined')
              .id('UIAttributesInterfaceReconstitution01_02')
              .fontSize(11)
              .fontWeight(FontWeight.Medium)
              .width('100%')
              .height(36)
              .backgroundColor('#FF9800')
              .fontColor('#FFFFFF')
              .borderRadius(6)
              .onClick(() => {
                console.info('renderGroup: 点击 undefined 按钮');
                this.renderGroupValue = undefined;
                this.currentMode = 'undefined';
                this.statusMessage = '✓ 已设置为 undefined';
                this.statusColor = Color.Orange;
                console.info('renderGroup: 当前值 = undefined');
              })

            // 正常值按钮（false）
            Button('正常值 (false)')
              .id('UIAttributesInterfaceReconstitution01_03')
              .fontSize(11)
              .fontWeight(FontWeight.Medium)
              .width('100%')
              .height(36)
              .backgroundColor('#2196F3')
              .fontColor('#FFFFFF')
              .borderRadius(6)
              .onClick(() => {
                console.info('renderGroup: 点击正常值按钮');
                this.renderGroupValue = false;
                this.currentMode = '正常值(false)';
                this.statusMessage = '✓ 已设置为 false（非离屏渲染）';
                this.statusColor = Color.Blue;
                console.info('renderGroup: 当前值 = false');
              })

            // 正常值按钮（true）
            Button('正常值 (true)')
              .id('UIAttributesInterfaceReconstitution01_04')
              .fontSize(11)
              .fontWeight(FontWeight.Medium)
              .width('100%')
              .height(36)
              .backgroundColor('#673AB7')
              .fontColor('#FFFFFF')
              .borderRadius(6)
              .onClick(() => {
                console.info('renderGroup: 点击正常值(true)按钮');
                this.renderGroupValue = true;
                this.currentMode = '正常值(true)';
                this.statusMessage = '✓ 已设置为 true（离屏渲染）';
                this.statusColor = Color.Brown;
                console.info('renderGroup: 当前值 = true');
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
              Text('1. 点击"静态赋值"按钮，设置 renderGroup(true)')
                .fontSize(9)
                .fontColor('#666666')
                .width('100%')

              Text('2. 点击"undefined"按钮，设置 renderGroup(undefined)')
                .fontSize(9)
                .fontColor('#666666')
                .width('100%')

              Text('3. 点击"正常值"按钮，设置 renderGroup(false/true)')
                .fontSize(9)
                .fontColor('#666666')
                .width('100%')

              Text('4. 观察效果展示区的渲染效果')
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
              Text('• 静态赋值(true)：启用离屏渲染，内部透明度生效')
                .fontSize(9)
                .fontColor('#4CAF50')
                .width('100%')

              Text('• undefined：恢复默认效果，无崩溃')
                .fontSize(9)
                .fontColor('#4CAF50')
                .width('100%')

              Text('• 正常值(false)：不离屏渲染，透明度叠加效果不同')
                .fontSize(9)
                .fontColor('#4CAF50')
                .width('100%')

              Text('• 正常值(true)：启用离屏渲染，效果正常')
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
