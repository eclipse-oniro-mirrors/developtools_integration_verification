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

import { abilityManager, Configuration } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct UiComponentButtonButtonRadius11 {
  @State currentFontSizeScale: number = 1;
  @State buttonPressed: boolean = false;
  @State pressCount: number = 0;
  @State logMessage: string = '等待操作...';

  async setFontScale(scale: number): Promise<void> {
    let configInit: Configuration = {
      fontSizeScale: scale,
    };
    abilityManager.updateConfiguration(configInit, (err: BusinessError) => {
      if (err) {
        console.error(`updateConfiguration fail, err: ${JSON.stringify(err)}`);
        this.logMessage = `字体设置失败: ${err.message}`;
      } else {
        this.currentFontSizeScale = scale;
        console.log('updateConfiguration success.');
        this.logMessage = `字体大小已设置为: ${scale}倍`;
      }
    });
  }

  build() {
    Scroll() {
      Column({ space: 3 }) {
        Column({ space: 3 }) {
          Row({ space: 2 }) {
            Text('Button适老化测试')
              .fontSize(24)
              .fontWeight(FontWeight.Bold)
              .fontColor(Color.White)
              .backgroundColor('#FF6B35')
              .width('90%')
              .padding(15)
              .borderRadius(10)
              .textAlign(TextAlign.Center)
              .margin({ top: 20 })
          }

          Row({ space: 5 }) {
            Text('字体:')
              .fontSize(12)
              .fontStyle(FontStyle.Italic)
              .fontWeight(FontWeight.Bold)
            Text(`${this.currentFontSizeScale}倍`)
              .fontSize(14)
              .fontStyle(FontStyle.Italic)
              .fontWeight(FontWeight.Bold)
              .fontColor('#FF6B35')
            Text('次数:')
              .fontSize(12)
              .fontStyle(FontStyle.Italic)
              .fontWeight(FontWeight.Bold)
              .margin({ left: 10 })
            Text(`${this.pressCount}`)
              .fontSize(14)
              .fontStyle(FontStyle.Italic)
              .fontWeight(FontWeight.Bold)
              .fontColor('#2196F3')
            Text('状态:')
              .fontSize(12)
              .fontStyle(FontStyle.Italic)
              .fontWeight(FontWeight.Bold)
              .margin({ left: 10 })
            Text(this.buttonPressed ? '按下' : '释放')
              .fontSize(12)
              .fontStyle(FontStyle.Italic)
              .fontColor(this.buttonPressed ? '#4CAF50' : '#999')
          }
        }
        .width('95%')
        .padding(8)
        .backgroundColor('#FFF3E0')
        .borderRadius(5)
        .margin({ top: 5 })

        Button('测试按钮 - 请长按观察')
          .controlSize(ControlSize.NORMAL)
          .width('90%')
          .height(50)
          .margin({ top: 5 })
          .onClick(() => {
            this.pressCount++;
            this.logMessage = `点击${this.pressCount}次`;
            console.log(`Button clicked, count: ${this.pressCount}`);
          })
          .onTouch((event: TouchEvent) => {
            if (event.type === TouchType.Down) {
              this.buttonPressed = true;
              this.logMessage = '按下';
              console.log('Button pressed down');
            } else if (event.type === TouchType.Up) {
              this.buttonPressed = false;
              this.logMessage = '释放';
              console.log('Button released');
            }
          })
          .id('TestButton')

        Column({ space: 1 }) {
          Text('字体控制')
            .fontSize(13)
            .fontWeight(FontWeight.Bold)
          Row({ space: 5 }) {
            Button('1倍')
              .fontSize(8)
              .id('UiComponentButtonButtonRadius11_01')
              .type(ButtonType.Capsule)
              .labelStyle(
                { overflow:TextOverflow.Ellipsis,
                  maxLines:3,
                  minFontSize: 0
                })
              .height(35)
              .onClick(() => {
                this.setFontScale(1)
              })
              .backgroundColor('#9E9E9E')

            Button('1.75倍')
              .fontSize(8)
              .type(ButtonType.Capsule)
              .id('UiComponentButtonButtonRadius11_02')
              .labelStyle(
                { overflow:TextOverflow.Ellipsis,
                  maxLines:3,
                  minFontSize: 0
                })
              .height(35)
              .onClick(() => {
                this.setFontScale(1.75)
              })
              .backgroundColor('#2196F3')

            Button('2倍')
              .fontSize(8)
              .height(35)
              .type(ButtonType.Capsule)
              .id('UiComponentButtonButtonRadius11_03')
              .labelStyle(
                { overflow:TextOverflow.Ellipsis,
                  maxLines:3,
                  minFontSize: 0
                })
              .onClick(() => {
                this.setFontScale(2)
              })
              .backgroundColor('#FF9800')

            Button('3.2倍')
              .fontSize(8)
              .height(35)
              .type(ButtonType.Capsule)
              .id('UiComponentButtonButtonRadius11_04')
              .labelStyle(
                { overflow:TextOverflow.Ellipsis,
                  maxLines:3,
                  minFontSize: 0
                })
              .onClick(() => {
                this.setFontScale(3.2)
              })
              .backgroundColor('#F44336')
          }
          .width('100%')
          .justifyContent(FlexAlign.SpaceEvenly)
        }
        .width('95%')
        .padding(8)
        .backgroundColor('#FFF9C4')
        .borderRadius(5)
        .margin({ top: 5 })

        Column({ space: 2 }) {
          Text('配置: Type默认 controlSize=NORMAL buttonStyle=EMPHASIZED')
            .fontSize(11)
            .fontStyle(FontStyle.Italic)
            .fontColor('#666')
        }
        .width('95%')
        .padding(6)
        .backgroundColor('#F5F5F5')
        .borderRadius(5)
        .margin({ top: 5 })

        Column({ space: 2 }) {
          Text('预期: 圆角矩形(20vp) 适老化后圆角不变 按压正常 强调按钮')
            .fontSize(11)
            .fontStyle(FontStyle.Italic)
            .fontColor('#D32F2F')
        }
        .width('95%')
        .padding(6)
        .backgroundColor('#FFEBEE')
        .borderRadius(5)
        .margin({ top: 5, bottom: 5 })
      }
      .width('100%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FAFAFA')
  }
}
