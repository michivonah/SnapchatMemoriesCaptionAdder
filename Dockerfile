FROM python:3.14

RUN apt update && apt upgrade -y
RUN apt install ffmpeg libvips -y

RUN git clone https://github.com/aidandenlinger/SnapchatMemoriesCaptionAdder
WORKDIR /SnapchatMemoriesCaptionAdder/

RUN python -m pip install -r requirements.txt

RUN mkdir input
RUN mkdir output

CMD ["python", "main.py", "--output", "./output/output"]

# Mount media to /SnapchatMemoriesCaptionAdder/input
# Mount output at /SnapchatMemoriesCaptionAdder/output

# Build image: docker build -t <IMAGE-NAME> .
# Run process: docker run -v /local/input/:/SnapchatMemoriesCaptionAdder/input:ro -v /local/output/:/SnapchatMemoriesCaptionAdder/output:rw <IMAGENAME>
# Optional specifiy timezone with: TZ=Europe/Zurich