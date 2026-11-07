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

@Entry
@Component
struct ButtonSuitableForAging01 {
  @State controlSize: ControlSize = ControlSize.NORMAL;
  @State fontSize: number = 30;
  @State fontWeight: FontWeight = FontWeight.Normal;
  @State fontStyle: FontStyle = FontStyle.Normal;
  @State buttonStyle: ButtonStyleMode = ButtonStyleMode.NORMAL;
  @State role: ButtonRole = ButtonRole.NORMAL;
  @State type: ButtonType = ButtonType.Normal;
  @State isEnabled: boolean = true;
  @State buttonText: string = '设置type、controlSize、fontSize、fontWeight、fontStyle、buttonStyle、role，改变按钮样式,内部不包含其他组件';
  @State testColor: string = '#007DFF';
  @State textColor: string = '#FFFFFF';
  @State currentScale: number = 1.75;
  @State testResult: string = '等待测试';
  @State clickCount: number = 0;
  @State lastClickTime: string = '';
  @State testStartTime: string = '';
  @State testDuration: string = '';
  @State testScore: number = 0;
  @State testLevel: string = '初级';
  @State performanceRating: string = '良好';

  build() {
    Column({ space: 20 }) {
      // 页面标题
      Text('Button适老化测试 - fontSize为30，字体1.75倍')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })
        .textAlign(TextAlign.Center)

      // 测试说明
      Text('本页面用于测试Button组件在适老化场景下的表现，测试fontSize属性设置和1.75倍字体缩放')
        .fontSize(14)
        .fontColor('#666666')
        .margin({ bottom: 20 })
        .textAlign(TextAlign.Center)

      // 字体缩放信息
      Row({ space: 10 }) {
        Text('当前字体缩放:')
          .fontSize(14)
        Text(`${this.currentScale}倍`)
          .fontSize(14)
          .fontColor('#007DFF')
          .fontWeight(FontWeight.Bold)
      }
      .margin({ bottom: 20 })

      // 控制面板区域
      Column({ space: 15 }) {
        Text('控制面板')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        // 字体大小控制
        Row({ space: 10 }) {
          Text('fontSize:')
            .fontSize(14)
          Button('20px')
            .onClick(() => {
              this.fontSize = 20;
            })
          Button('30px')
            .id('fontSize_30_1x')
            .onClick(() => {
              this.fontSize = 30;
            })
          Button('40px')
            .onClick(() => {
              this.fontSize = 40;
            })
        }

        // 字体缩放控制
        Row({ space: 10 }) {
          Text('字体缩放:')
            .fontSize(14)
          Button('1倍')
            .onClick(() => {
              this.currentScale = 1.0;
            })
          Button('1.75倍')
            .onClick(() => {
              this.currentScale = 1.75;
            })
          Button('2倍')
            .onClick(() => {
              this.currentScale = 2.0;
            })
        }

        // 控制大小控制
        Row({ space: 10 }) {
          Text('控制大小:')
            .fontSize(14)
          Button('Small')
            .id('controlSize_small_01')
            .onClick(() => {
              this.controlSize = ControlSize.SMALL;
            })
          Button('Normal')
            .onClick(() => {
              this.controlSize = ControlSize.NORMAL;
            })
        }

        // 按钮样式控制
        Row({ space: 10 }) {
          Text('按钮样式:')
            .fontSize(14)
          Button('Normal')
            .onClick(() => {
              this.buttonStyle = ButtonStyleMode.NORMAL;
            })
          Button('Emphasized')
            .onClick(() => {
              this.buttonStyle = ButtonStyleMode.EMPHASIZED;
            })
          Button('Textual')
            .onClick(() => {
              this.buttonStyle = ButtonStyleMode.TEXTUAL;
            })
        }

        // 按钮状态控制
        Row({ space: 10 }) {
          Text('按钮状态:')
            .fontSize(14)
          Button('启用')
            .onClick(() => {
              this.isEnabled = true;
            })
          Button('禁用')
            .onClick(() => {
              this.isEnabled = false;
            })
        }
      }
      .padding(15)
      .backgroundColor('#f0f0f0')
      .borderRadius(8)
      .margin({ bottom: 20 })

      // 测试按钮区域
      Column({ space: 10 }) {
        Text('测试按钮')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Button(this.buttonText)
          .type(this.type)
          .controlSize(this.controlSize)
          .fontSize(this.fontSize)
          .fontWeight(this.fontWeight)
          .fontStyle(this.fontStyle)
          .buttonStyle(this.buttonStyle)
          .role(this.role)
          .enabled(this.isEnabled)
          .backgroundColor(this.testColor)
          .fontColor(this.textColor)
          .width('100%')
          .height(60)
          .borderRadius(8)
          .onClick(() => {
            this.clickCount++;
            this.lastClickTime = new Date().toLocaleTimeString();
            if (this.testStartTime === '') {
              this.testStartTime = new Date().toLocaleTimeString();
            }
            this.testDuration = this.calculateDuration();
            this.testScore = this.calculateTestScore();
            this.testLevel = this.calculateTestLevel();
            this.performanceRating = this.calculatePerformanceRating();
            this.testResult = `测试通过 - 点击次数: ${this.clickCount} - 得分: ${this.testScore} - 等级: ${this.testLevel} - 性能: ${this.performanceRating}`;
            console.log('Button clicked with fontSize 30 and 1.75x font scale');
          })
      }
      .width('100%')
      .padding(15)
      .backgroundColor('#ffffff')
      .borderRadius(8)
      .shadow({ radius: 4, color: '#00000020', offsetX: 0, offsetY: 2 })

      // 测试结果区域
      Column({ space: 5 }) {
        Text('测试结果')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 })

        Text(this.testResult)
          .fontSize(12)
          .fontColor(this.testResult.includes('通过') ? '#4CAF50' : '#666666')
          .padding(8)
          .backgroundColor(this.testResult.includes('通过') ? '#E8F5E8' : '#F5F5F5')
          .borderRadius(4)
      }
      .width('100%')
      .padding(10)
      .backgroundColor('#f8f8f8')
      .borderRadius(6)
      .margin({ top: 10 })

      // 状态信息显示
      Column({ space: 5 }) {
        Text('当前状态信息')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 })

        Text(`字体大小: ${this.fontSize}px`)
          .fontSize(12)
          .fontColor('#666666')
        Text(`按钮样式: ${this.buttonStyle}`)
          .fontSize(12)
          .fontColor('#666666')
        Text(`按钮类型: ${this.type}`)
          .fontSize(12)
          .fontColor('#666666')
        Text(`按钮角色: ${this.role}`)
          .fontSize(12)
          .fontColor('#666666')
        Text(`按钮状态: ${this.isEnabled ? '启用' : '禁用'}`)
          .fontSize(12)
          .fontColor('#666666')
        Text(`字体缩放: ${this.currentScale}倍`)
          .fontSize(12)
          .fontColor('#666666')
        Text(`点击次数: ${this.clickCount}`)
          .fontSize(12)
          .fontColor('#666666')
        Text(`最后点击时间: ${this.lastClickTime}`)
          .fontSize(12)
          .fontColor('#666666')
        Text(`测试开始时间: ${this.testStartTime}`)
          .fontSize(12)
          .fontColor('#666666')
        Text(`测试持续时间: ${this.testDuration}`)
          .fontSize(12)
          .fontColor('#666666')
        Text(`测试得分: ${this.testScore}`)
          .fontSize(12)
          .fontColor('#666666')
        Text(`测试等级: ${this.testLevel}`)
          .fontSize(12)
          .fontColor('#666666')
        Text(`性能评级: ${this.performanceRating}`)
          .fontSize(12)
          .fontColor('#666666')
      }
      .width('100%')
      .padding(10)
      .backgroundColor('#f8f8f8')
      .borderRadius(6)
      .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('#ffffff')
  }

  private calculateDuration(): string {
    if (this.testStartTime === '') {
      return '0秒';
    }
    const startTime = new Date(`1970-01-01 ${this.testStartTime}`);
    const currentTime = new Date();
    const duration = Math.floor((currentTime.getTime() - startTime.getTime()) / 1000);
    return `${duration}秒`;
  }

  private calculateTestScore(): number {
    let score = 0;
    score += this.clickCount * 10; // 每次点击10分
    if (this.currentScale >= 1.5) {
      score += 30; // 高字体缩放额外加分
    }
    if (this.isEnabled) {
      score += 20; // 启用状态加分
    }
    return score;
  }

  private calculateTestLevel(): string {
    if (this.testScore >= 100) {
      return '高级';
    } else if (this.testScore >= 50) {
      return '中级';
    } else {
      return '初级';
    }
  }

  private calculatePerformanceRating(): string {
    if (this.testScore >= 150) {
      return '优秀';
    } else if (this.testScore >= 100) {
      return '良好';
    } else if (this.testScore >= 50) {
      return '一般';
    } else {
      return '待改进';
    }
  }
}
