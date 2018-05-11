exit_requested = false
Kernel.trap( "INT" ) { exit_requested = true }

while !exit_requested
  val = gets.chomp
  # Removes white space and commas from the string
  nwVal = val.gsub(/[\s,]/, "")
  # Counts how many mathematics operators are in the string - not needed
  # iter = nwVal.scan(Regexp.union(/\+/, /-/, /\*/, /\//)).count
  # Splits the string into an array
  varAry = nwVal.split(%r{(\+|\-|\/|\*)})

  # 2+1+8-4/2*3
  # 2+1+8-2*3
  # 2+1+8-6
  # 3+8-6
  # 11-6
  # 5

  # PEMDAS
  # Parens
  # Exponents
  # Multiply
  # Divide
  # Add
  # Subtract

  newAry = varAry
  mdOps = varAry

  while mdOps.join("") =~ /[*\/]/
    newAry.each_with_index do |x, i|
      if x === "/" || x === "*"
        if x === "/"
          newAry[i] = (newAry[i-1].to_i / newAry[i+1].to_i).to_s
        else
          newAry[i] = (newAry[i-1].to_i * newAry[i+1].to_i).to_s
        end
        newAry.delete_at(i-1)
        newAry.delete_at(i)
        # mdOps.delete_at(i)
      end
    end
  end

  asOps = mdOps

  while asOps.join("") =~ /[-+]/
    newAry.each_with_index do |x, i|
      if x === "+" || x === "-"
        if x === "+"
          newAry[i] = (newAry[i-1].to_i + newAry[i+1].to_i).to_s
        else
          newAry[i] = (newAry[i-1].to_i - newAry[i+1].to_i).to_s
        end
        newAry.delete_at(i-1)
        newAry.delete_at(i)
        # asOps.delete_at(i)
      end
    end
  end

  puts newAry.join("").to_i
end
