' 简化版Word数字千位分隔符格式化宏
' 该宏将选中文本中的数字转换为带千位分隔符的格式
' 例如：1234567.89 → 1,234,567.89
' 排除年份格式（如"2025年"、"2,025.年"）和百分比符号（%）附近的数字

Sub ConvertSelectedTextToThousands()
    Dim originalText As String
    Dim newText As String
    Dim i As Long
    Dim char As String
    Dim numberStart As Long
    Dim currentNumber As String
    Dim formattedNumber As String
    
    ' 检查是否有选中文本
    If Selection.Range.Information(wdWithInTable) = True Then
        MsgBox "请不要在表格中使用此宏", vbExclamation
        Exit Sub
    End If
    
    If Selection.Range.Characters.Count = 0 Then
        MsgBox "请先选择要格式化的文本", vbExclamation
        Exit Sub
    End If
    
    originalText = Selection.Range.Text
    newText = ""
    i = 1
    numberStart = 1
    
    Do While i <= Len(originalText)
        char = Mid(originalText, i, 1)
        
        ' 检查是否为数字或小数点
        If IsNumeric(char) Or char = "." Then
            ' 开始收集数字
            currentNumber = char
            numberStart = i
            
            ' 继续收集连续的数字和小数点
            Do While i + 1 <= Len(originalText)
                char = Mid(originalText, i + 1, 1)
                If IsNumeric(char) Or char = "." Then
                    currentNumber = currentNumber & char
                    i = i + 1
                Else
                    Exit Do
                End If
            Loop
            
            ' 检查这个数字是否应该被格式化
            If ShouldFormatNumber(originalText, numberStart, currentNumber) Then
                ' 检查数字长度是否大于等于4位才添加千位分隔符
                If Len(currentNumber) - Len(Replace(currentNumber, ".", "")) <= 1 Then ' 最多一个小数点
                    Dim integerPart As String
                    Dim decimalPart As String
                    
                    If InStr(currentNumber, ".") > 0 Then
                        integerPart = Left(currentNumber, InStr(currentNumber, ".") - 1)
                        decimalPart = Mid(currentNumber, InStr(currentNumber, "."))
                    Else
                        integerPart = currentNumber
                        decimalPart = ""
                    End If
                    
                    ' 只对整数部分大于等于4位的数字进行格式化
                    If Len(integerPart) >= 4 Then
                        ' 判断是否为整数（没有小数部分或小数部分为0）
                        Dim isIntegerValue As Boolean
                        If decimalPart = "" Or decimalPart = ".0" Or decimalPart = ".00" Or decimalPart = ".000" Or decimalPart = ".0000" Or _
                           decimalPart = ".00000" Or decimalPart = ".000000" Or decimalPart = ".0000000" Or decimalPart = ".00000000" Then
                            isIntegerValue = True
                        Else
                            isIntegerValue = False
                        End If
                        
                        formattedNumber = FormatNumberWithCommas(CDbl(currentNumber), isIntegerValue)
                        newText = newText & formattedNumber
                    Else
                        newText = newText & currentNumber
                    End If
                Else
                    ' 包含多个小数点，不处理
                    newText = newText & currentNumber
                End If
            Else
                newText = newText & currentNumber
            End If
        Else
            newText = newText & char
        End If
        
        i = i + 1
    Loop
    
    ' 替换选中文本
    Selection.Range.Text = newText
End Sub

' 检查数字是否应该被格式化
' 排除年份格式（如"2025年"、"2,025.年"）和百分比符号（%）附近的数字
Private Function ShouldFormatNumber(originalText As String, numberStart As Long, numberStr As String) As Boolean
    Dim numberEnd As Long
    Dim beforeNumber As String
    Dim afterNumber As String
    Dim afterNumberChar As String
    Dim beforeNumberChar As String
    
    numberEnd = numberStart + Len(numberStr) - 1
    
    ' 获取数字前后的字符
    If numberStart > 1 Then
        beforeNumberChar = Mid(originalText, numberStart - 1, 1)
    Else
        beforeNumberChar = ""
    End If
    
    If numberEnd < Len(originalText) Then
        afterNumberChar = Mid(originalText, numberEnd + 1, 1)
    Else
        afterNumberChar = ""
    End If
    
    ' 检查是否为年份格式（数字后跟"年"或".年"）
    If afterNumberChar = "年" Then
        ShouldFormatNumber = False
        Exit Function
    End If
    
    If afterNumberChar = "." And numberEnd + 1 < Len(originalText) Then
        If Mid(originalText, numberEnd + 2, 1) = "年" Then
            ShouldFormatNumber = False
            Exit Function
        End If
    End If
    
    ' 检查是否在百分比符号附近（数字前后有%符号）
    If beforeNumberChar = "%" Or afterNumberChar = "%" Then
        ShouldFormatNumber = False
        Exit Function
    End If
    
    ' 检查数字是否为4位数且后面是"年"字
    Dim numberValue As Double
    If IsNumeric(numberStr) Then
        numberValue = CDbl(numberStr)
        If Len(numberStr) = 4 And Int(numberValue) = numberValue And afterNumberChar = "年" Then
            ShouldFormatNumber = False
            Exit Function
        End If
    End If
    
    ' 其他情况都格式化
    ShouldFormatNumber = True
End Function

' 使用VBA的Format函数为数字添加千位分隔符
Private Function FormatNumberWithCommas(numberValue As Double, isInteger As Boolean) As String
    If isInteger Then
        ' 对于整数，格式化为带千位分隔符和两位小数的形式
        FormatNumberWithCommas = Format(numberValue, "#,##0.00")
    Else
        ' 对于小数，保留原有小数位
        FormatNumberWithCommas = Format(numberValue, "#,##0.##############################")
        
        ' 去除尾部多余的0和小数点（但保留至少两位小数）
        If InStr(FormatNumberWithCommas, ".") > 0 Then
            Dim decimalPart As String
            decimalPart = Right(FormatNumberWithCommas, Len(FormatNumberWithCommas) - InStr(FormatNumberWithCommas, "."))
            
            ' 如果是原始的整数（以.00结尾），保持两位小数
            If Len(decimalPart) >= 2 And Left(decimalPart, 2) = "00" And Len(decimalPart) = 2 Then
                ' 保持两位小数
            Else
                ' 去除多余尾部的0
                Do While Right(FormatNumberWithCommas, 1) = "0"
                    FormatNumberWithCommas = Left(FormatNumberWithCommas, Len(FormatNumberWithCommas) - 1)
                Loop
                If Right(FormatNumberWithCommas, 1) = "." Then
                    FormatNumberWithCommas = Left(FormatNumberWithCommas, Len(FormatNumberWithCommas) - 1)
                End If
            End If
        End If
    End If
End Function