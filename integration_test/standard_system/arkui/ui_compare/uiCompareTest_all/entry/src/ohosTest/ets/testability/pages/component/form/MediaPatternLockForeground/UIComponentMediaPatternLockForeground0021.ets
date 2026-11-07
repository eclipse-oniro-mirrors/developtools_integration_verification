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
import { LengthMetrics, LengthUnit, uiAppearance } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

class PatternLockModifier implements AttributeModifier<PatternLockAttribute> {
  public activateCircleRadiusValue: number = 9;
  public skipUnselectedPointFlag: boolean = false;

  applyNormalAttribute(instance: PatternLockAttribute): void {
    instance.activateCircleStyle({
      radius: {
        value: this.activateCircleRadiusValue,
        unit: LengthUnit.VP
      },
      color: Color.Red
    });
    instance.skipUnselectedPoint(this.skipUnselectedPointFlag);
  }
}

@Entry
@Component
struct UIComponentMediaPatternLockForeground0021 {
  @State name: string = 'UIComponentMediaPatternLockForeground0021';
  @State message: string = 'UIComponentMediaPatternLockForeground0021';
  @State modifier: PatternLockModifier = new PatternLockModifier();
  private patternLockController1: PatternLockController = new PatternLockController();
  private patternLockController2: PatternLockController = new PatternLockController();

  aboutToAppear(): void {
    this.modifier.activateCircleRadiusValue = 12;
    this.modifier.skipUnselectedPointFlag = true;
  }

  build() {
    Column() {
      Text(this.message)
        .margin(10)

      Row() {
        Text('原生调用:')
          .margin(5)
        PatternLock(this.patternLockController1)
          .id(this.name + '_01')
          .sideLength(300)
          .circleRadius(9)
          .pathStrokeWidth(5)
          .activeColor(Color.Blue)
          .selectedColor(Color.Blue)
          .pathColor(Color.Blue)
          .backgroundColor('#F5F5F5')
          .autoReset(true)
          .margin(10)
          .activateCircleStyle({
            radius: {
              value: 12,
              unit: LengthUnit.VP
            },
            color: Color.Red
          })
          .skipUnselectedPoint(true)
          .onPatternComplete((input: number[]) => {
            this.message += '\nPatternLock1 onPatternComplete: ' + input.toString();
          })
      }

      Row() {
        Text('modifier调用:')
          .margin(5)
        PatternLock(this.patternLockController2)
          .id(this.name + '_02')
          .sideLength(300)
          .circleRadius(9)
          .pathStrokeWidth(5)
          .activeColor(Color.Blue)
          .selectedColor(Color.Blue)
          .pathColor(Color.Blue)
          .backgroundColor('#F5F5F5')
          .autoReset(true)
          .margin(10)
          .attributeModifier(this.modifier)
          .onPatternComplete((input: number[]) => {
            this.message += '\nPatternLock2 onPatternComplete: ' + input.toString();
          })
      }

    }
    .width('100%')
    .height('100%')
  }
}