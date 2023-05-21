def remove_duplicates(input_file, output_file):
    unique_lines = set()

    with open(input_file, 'r') as file:
        for line in file:
            i = line.find(". ")
            unique_lines.add((line[(i + 1)::]).strip())

    with open(output_file, 'w') as file:
        for line in unique_lines:
            file.write(line + '\n')

    print(f"Unique lines written to {output_file}.")


# Usage example
input_file = 'input.txt'  # Replace with the path to your input file
output_file = 'output.txt'  # Replace with the desired output file path

remove_duplicates(input_file, output_file)
