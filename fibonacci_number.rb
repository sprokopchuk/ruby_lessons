def fibonacci_number n
  fibonacci_number_iter 1, 0, n
end

def fibonacci_number_iter a, b, n
  if n == 0
    b
  else
    fibonacci_number_iter a + b, a, n - 1
  end
end
