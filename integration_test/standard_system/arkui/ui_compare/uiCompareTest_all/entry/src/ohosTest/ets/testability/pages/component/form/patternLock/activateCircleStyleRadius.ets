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

import { LengthUnit, Router } from '@kit.ArkUI';

@Entry
@Component
struct ActivateCircleStyleRadius {
  @State passwords: Number[] = []
  @State message: string = 'please input password!'
  private patternLockController1: PatternLockController = new PatternLockController()
  private patternLockController2: PatternLockController = new PatternLockController()
  router: Router = this.getUIContext().getRouter();

  build() {
    Column() {
      Text('undefined')
        .textAlign(TextAlign.Center)
        .margin(20)
        .fontSize(20)
      PatternLock(this.patternLockController1)
        .sideLength(150)
        .circleRadius(9)
        .pathStrokeWidth(18)
        .activeColor('#B0C4DE')
        .selectedColor('#228B22')
        .pathColor('#90EE90')
        .backgroundColor('#F5F5F5')
        .activateCircleStyle({
          color: '#707070',
          radius: undefined,
          enableWaveEffect: true
        })
        .autoReset(true)
        .onDotConnect((index: number) => {
          console.log('onDotConnect index: ' + index)
        })
        .onPatternComplete((input: number[]) => {
          // 输入的密码长度小于5时，提示重新输入
          if (input === null || input === undefined || input.length < 5) {
            this.message = 'The password length needs to be greater than 5, please enter again.'
            return
          }
          // 判断密码长度是否大于0
          if (this.passwords.length > 0) {
            // 判断两次输入的密码是否相同，相同则提示密码设置成功，否则提示重新输入
            if (this.passwords.toString() === input.toString()) {
              this.passwords = input
              this.message = 'Set password successfully: ' + this.passwords.toString()
              this.patternLockController1.setChallengeResult(PatternLockChallengeResult.CORRECT)
            } else {
              this.message = 'Inconsistent passwords, please enter again.'
              this.patternLockController1.setChallengeResult(PatternLockChallengeResult.WRONG)
            }
          } else {
            // 提示第二次输入密码
            this.passwords = input
            this.message = 'Please enter again.'
          }
        })

      Text('null')
        .textAlign(TextAlign.Center)
        .margin(20)
        .fontSize(20)
      PatternLock(this.patternLockController2)
        .sideLength(150)
        .circleRadius(9)
        .pathStrokeWidth(18)
        .activeColor('#B0C4DE')
        .selectedColor('#228B22')
        .pathColor('#90EE90')
        .backgroundColor('#F5F5F5')
        .activateCircleStyle({
          color: '#707070',
          radius: null,
          enableWaveEffect: true
        })
        .autoReset(true)
        .onDotConnect((index: number) => {
          console.log('onDotConnect index: ' + index)
        })

      Button('Reset PatternLock').margin(30).onClick(() => {
        // 重置密码锁
        this.patternLockController2.reset()
        this.passwords = []
        this.message = 'Please input password'
      })
    }.width('100%').height('100%')
  }
}
