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

import { LengthUnit } from '@kit.ArkUI';

@Entry
@Component
struct PatternLock01 {
  @State passwords: Number[] = [];
  @State message: string = 'please input password!';
  @State sideLength:Length = 200;
  @State circleRadius:Length = 9;
  @State bgColor:ResourceColor = '#F5F5F5';
  @State regularColor:ResourceColor = '#F5F5F5';
  @State selectedColor:ResourceColor = '#F5F5F5';
  @State activeColor:ResourceColor = '#F5F5F5';
  @State pathColor:ResourceColor = '#F5F5F5';
  @State pathStrokeWidth:number | string = 4;
  @State autoReset:boolean = true;
  @State activateCircleStyle:Optional<CircleStyleOptions> = {
    color: '#707070',
    radius: { value: 16, unit: LengthUnit.VP },
    enableWaveEffect: true
  };
  @State skipUnselectedPoint:boolean = false;
  private patternLockController: PatternLockController = new PatternLockController();

  build() {
    Column() {
      Text(this.message).textAlign(TextAlign.Center).margin(20).fontSize(20)

      PatternLock(this.patternLockController)
        .sideLength(this.sideLength)
        .circleRadius(this.circleRadius)
        .pathStrokeWidth(this.pathStrokeWidth)
        .regularColor(this.regularColor)
        .activeColor(this.activeColor)
        .selectedColor(this.selectedColor)
        .pathColor(this.pathColor)
        .backgroundColor(this.bgColor)
        .autoReset(this.autoReset)
        .activateCircleStyle({
          color: '#707070',
          radius: { value: 16, unit: LengthUnit.VP },
          enableWaveEffect: true
        })
        .onDotConnect((index: number) => {
          console.log('onDotConnect index: ' + index);
        })
        .onPatternComplete((input: number[]) => {
          // 输入的密码长度小于5时，提示重新输入
          if (input.length < 5) {
            this.message = 'The password length needs to be greater than 5, please enter again.';
            return;
          }
          // 判断密码长度是否大于0
          if (this.passwords.length > 0) {
            // 判断两次输入的密码是否相同，相同则提示密码设置成功，否则提示重新输入
            if (this.passwords.toString() === input.toString()) {
              this.passwords = input;
              this.message = 'Set password successfully: ' + this.passwords.toString();
              this.patternLockController.setChallengeResult(PatternLockChallengeResult.CORRECT);
            } else {
              this.message = 'Inconsistent passwords, please enter again.';
              this.patternLockController.setChallengeResult(PatternLockChallengeResult.WRONG);
            }
          } else {
            // 提示第二次输入密码
            this.passwords = input;
            this.message = 'Please enter again.';
          }
        })

      Button('Reset PatternLock')
        .margin(30)
        .onClick(() => {
          // 重置密码锁
          this.patternLockController.reset();
          this.passwords = [];
          this.message = 'Please input password';
        })

      Row() {
        Button('sideLength 0')
          .id('PatternLock_01')
          .margin(10)
          .width('2%')
          .height('2%')
          .onClick(() => {
            this.sideLength = 0;
          })

        Button('sideLength -50')
          .id('PatternLock_02')
          .margin(10)
          .width('2%')
          .height('2%')
          .onClick(() => {
            this.sideLength = -50;
          })

        Button('sideLength 100')
          .id('PatternLock_03')
          .margin(10)
          .width('2%')
          .height('2%')
          .onClick(() => {
            this.sideLength = 100;
          })

        Button('circleRadius 0')
          .id('PatternLock_04')
          .margin(10)
          .width('2%')
          .height('2%')
          .onClick(() => {
            this.circleRadius = 0;
          })

        Button('circleRadius -10')
          .id('PatternLock_05')
          .margin(10)
          .width('2%')
          .height('2%')
          .onClick(() => {
            this.sideLength = -10;
          })

        Button('pathStrokeWidth 0')
          .id('PatternLock_06')
          .margin(10)
          .width('2%')
          .height('2%')
          .onClick(() => {
            this.pathStrokeWidth = 0;
          })

        Button('pathStrokeWidth -10')
          .id('PatternLock_07')
          .margin(10)
          .width('2%')
          .height('2%')
          .onClick(() => {
            this.pathStrokeWidth = -10;
          })

        Button('color')
          .id('PatternLock_08')
          .margin(10)
          .width('2%')
          .height('2%')
          .onClick(() => {
            this.bgColor = Color.Red;
            this.regularColor = Color.Red;
            this.selectedColor = Color.Red;
            this.activeColor = Color.Red;
            this.pathColor = Color.Red;
            this.pathStrokeWidth = Color.Red;
          })

        Button('autoReset')
          .id('PatternLock_09')
          .margin(10)
          .width('2%')
          .height('2%')
          .onClick(() => {
            this.autoReset = false;
          })
      }.margin(20)

      Row() {
        Button('reset sideLength')
          .id('PatternLock_001')
          .margin(10)
          .width('2%')
          .height('2%')
          .onClick(() => {
            this.sideLength = 200;
          })

        Button('reset circleRadius')
          .id('PatternLock_002')
          .margin(10)
          .width('2%')
          .height('2%')
          .onClick(() => {
            this.circleRadius = 6;
          })

        Button('reset pathStrokeWidth')
          .id('PatternLock_003')
          .margin(10)
          .width('2%')
          .height('2%')
          .onClick(() => {
            this.pathStrokeWidth = 12;
          }).margin(10)

      }.margin(20)

    }.width('100%').height('100%')
  }
}
